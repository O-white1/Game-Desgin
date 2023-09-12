extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var limit = int($txtlimit.text)
	var speed = int($txtspeed.text)
	var milesover = speed - limit
	var fine = 20 + (milesover * 5)
	$output.text = "fine: %.2f" % fine
	


func _on_btn_clear_pressed():
	$output.text = ""
	$txtlimit.text = ""
	$txtspeed.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
