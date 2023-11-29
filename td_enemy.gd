extends CharacterBody2D


const SPEED = 60.0
var MAXHP = 30.0
var HP = MAXHP
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

var intertia = Vector2()
var ai_timer_max = 0.5
var ai_timer = ai_timer_max - randi() % 5
var damage_lock = 0.0
var animation_lock = 0.0
var knockback = 128.0
var vision_distance = 40.0
var money_value = 5.0
signal recovered
@onready var raycastr = $"RayCast R"
@onready var raycastm = $"RayCastM"
@onready var raycastl = $"RayCastL"

func turn_toward_player_location(location: Vector2):
	var dir_to_player = (location - global_position).normalized()
	velocity = dir_to_player * (SPEED * 2)
	var closest_angle = INF
	var closest_state = STATES.IDLE
	for i in range(1, 5):
		var state_dir = state_directions[i]
		var angle_diff = abs(state_dir.angle(dir_to_player))
		if angle_diff < closest_angle:
			closest_angle = angle_diff
			closest_state = STATES.values()[i] 
	AI_STATE = closest_state
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
			
			
	pass


