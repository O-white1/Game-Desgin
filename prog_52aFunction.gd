extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass



func getArea(length, width):
	var area = length * width
	return area
	
func getPerim(length, width):
	return 2 * length + 2 * width


func _on_button_pressed():
	var l = int($txtLen.text)
	var w = int($txtWid.text)
	var a = getArea(l, w)
	var p = getPerim(l, w)
	$lbl_out.text = "Area: %d\nPerimeter: %d" % [a, p]
	


func _on_btn_clear_pressed():
	$txtLen.text = ""
	$txtWid.text = ""
	$lbl_out.text = ""

func _on_btn_exit_pressed():
	get_tree().quit()
