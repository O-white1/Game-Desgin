extends Area2D

var dmg = 10
var knockback = 90.0
var anim_life = 0.2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim_life -= delta
	if anim_life < 0:
		queue_free()
		return
		
	for enemy in get_tree().get_nodes_in_group("Enemy"):
		if overlaps_body(enemy):
			enemy.take_damage(dmg, self)
			enemy.inertia = (enemy.global_position-self.global_position).normalized() * knockback
