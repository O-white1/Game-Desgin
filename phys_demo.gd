extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$Panel/gravSlide.value = $phys_ball.gravity_scale


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func _input(event):
	if event is InputEventMouseButton and event.pressed:
		var nball = preload("res://phys_ball.tscn").instantiate()
		nball.position = event.position
		add_child(nball)


func _on_grav_slide_value_changed(value):
	for child in get_children():
		if child is RigidBody2D:
			child.gravity_scale = value


func _on_button_pressed():
	for child in get_children():
		if child is RigidBody2D:
			child.apply_central_impulse(Vector2.RIGHT * 500)


func _on_button_2_pressed():
	var v_intertia = float($Panel/txtI.text)
	var v_x = float($Panel/txtVx.text)
	var v_y = float($Panel/txtVy.text)
	var velocity = Vector2(v_x, v_y)
	for child in get_children():
		if child is RigidBody2D:
			child.intertia = v_intertia
			child.linear_velocity = velocity
