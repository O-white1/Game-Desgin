extends CharacterBody2D


const SPEED = 60.0
var MAXHP = 30.0
var HEALTH = MAXHP
var DMG = 10.0
var AI_STATE = STATES.IDLE

enum STATES { IDLE=0, UP, DOWN, LEFT, RIGHT, UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT, DAMAGED}

var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(), # up left
	Vector2(1, -1).normalized(), # up right
	Vector2(-1, 1).normalized(), # down left
	Vector2(1, 1).normalized(), # down right
	Vector2.ZERO
	
	
]

var inertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var damage_lock = 0.0
var animation_lock = 0.0
var knockback = 128.0
var vision_distance = 40.0
var money_value = 5.0
signal recovered

@onready var anim_player = $AnimatedSprite2D
@onready var aud_player = $AudioStreamPlayer2D
@onready var raycastr = $"RayCast R"
@onready var raycastm = $"RayCastM"
@onready var raycastl = $"RayCastL"

var drops = ["drop_coin", "drop_heart"]
var coin_scene = preload("res://entities/coin.tscn")
var heart_scene = preload("res://entities/mini_heart.tscn")
var deathsound = preload("res://assets/sounds/enemydeath.wav")


func  vec2_offset():
	return Vector2(randf_range(-10.0, 10.0), randf_range(-10.0, 10.0))
	
func drop_scene(item_scene):
	item_scene.global_position = self.global_position + vec2_offset()
	get_tree().current_scene.add_child(item_scene)
func drop_heart():
	var heart = heart_scene.instantiate()
	drop_scene(heart)
func drop_coin():
	var coin = coin_scene.instantiate()
	coin.value = money_value
	drop_scene(coin)
	
func drop_item():
	var num_drops = randi() % 3 + 1
	
	for i in range(num_drops):
		var rnd_drop = drops[randi() % drops.size()]
		call_deferred(rnd_drop)

func turn_toward_player_location(location: Vector2):
	var dir_to_player = (location - global_position).normalized()
	velocity = dir_to_player * (SPEED * 2)
	var closest_angle = INF
	var closest_state = STATES.IDLE
	for i in range(1, 5):
		var state_dir = state_directions[i]
		var angle_diff = abs(state_dir[i].angle(dir_to_player))
		if angle_diff < closest_angle:
			closest_angle = angle_diff
			closest_state = STATES.values()[i] 
	AI_STATE = closest_state
	
func take_damage(dmg, attacker=null):
	if damage_lock == 0.0:
		AI_STATE = STATES.DAMAGED
		HEALTH -= DMG
		damage_lock = 0.2
		animation_lock = 0.2
		
		if HEALTH <= 0:
			drop_item()
			aud_player.stream = deathsound
			await aud_player.finished
			queue_free()
		else:
			if attacker != null:
				var locarion = attacker.global_position
func _physics_process(delta):
	animation_lock = max(animation_lock-delta, 0.0)
	damage_lock = max(damage_lock-delta, 0.0)
	if int(AI_STATE) >= 1 and int(AI_STATE) <= 8:
		var raydir = state_directions[int(AI_STATE)]
		raycastm.target_position = raydir * vision_distance
		raycastl.target_position = raydir.rotated(deg_to_rad(-45)).normalized() * vision_distance
		raycastl.target_position = raydir.rotated(deg_to_rad(45)).normalized() * vision_distance
	if animation_lock == 0.0:
		if AI_STATE == STATES.DAMAGED:
			AI_STATE = STATES.IDLE
			recovered.emit()
			
		for player in get_tree().get_nodes_in_group("Player"):
			if $AttackBox.overlaps_body(player):
				if player.damage_lock == 0.0:
					player.inertia = (player.global_position - global_position).normalized() * knockback
					player.take_damage
				else:
					return
			if player.data.state != player.STATES.DEAD:
				if (raycastm.is_colliding() and raycastm.get_collider() == player) or \
					(raycastl.is_colliding() and raycastl.get_collider() == player) or \
					(raycastr.is_colliding() and raycastr.get_collider() == player):
						turn_toward_player_location(player.global_position)
		ai_timer = clamp(ai_timer-delta, 0.0, ai_timer_max)
		if ai_timer == 0.0:
			if AI_STATE == STATES.IDLE:
				var rnd_mov = randi() % 4
				AI_STATE = STATES.values()[rnd_mov+1]
			else:
				AI_STATE = STATES.IDLE
			ai_timer = ai_timer_max
		var direction = state_directions[int(AI_STATE)]
		velocity = direction * SPEED
		
		var animation = state_animations[int(AI_STATE)]
		if animation and not anim_player.is_playing():
			anim_player.play(animation)
			
		if AI_STATE == STATES.IDLE and anim_player.is_playing():
			anim_player.stop()
		
		#todo: Walk animation stuff.
		velocity += inertia
		move_and_slide()
		inertia = inertia.move_toward(Vector2(), delta * 1000.0)
			
	pass


