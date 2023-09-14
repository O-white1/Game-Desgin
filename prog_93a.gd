extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_calc_pressed():
	var killowats = ($txt_killowats)
	var baserate = (killowats * 0.0475)
	
