extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_quit_pressed():
	get_tree().quit()

func _on_btn_clear_pressed():
	$txtlen.text = ""
	$pxtWid.text = ""
	$LBLout.text = ""


func _on_btn_calc_pressed():
	var len = int($txtlen.text)
	var wid = int($pxtWid.text)
	var area = len * wid
	var perim = 2 * len + 2 * wid
	$LBLout.text = "Area:" +str(area) + "\nPerimeter" +str(perim)
	# int() - whole numbers +-
	# float() - real numbers AKA w/ decimals +-
	# str() - text
