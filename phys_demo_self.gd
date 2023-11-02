extends Node2D



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://rigid_body_2d.tscn").instantiate()
		nball.position = event.position
		add_child(nball)


	



func _on_button_pressed():
	var wind = int($"Debug panel/txt_wind".text)
	var grav= int($"Debug panel/txt_gravity".text)
	for child in get_children():
		if child is RigidBody2D:
			child.apply_central_impulse(Vector2.RIGHT * wind)
			child.gravity_scale = grav


func _on_button_2_pressed():
	get_tree().reload_current_scene()
