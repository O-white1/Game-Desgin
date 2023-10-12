extends Area2D

func _on_body_entered(body):
	if body.name == "kbd_player":
		OS.alert("You Won!")
