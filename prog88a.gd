extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var num1 = int($enter_num1.text)
	var num2 = int($enter_num2.text)
	var Sum = num1 + num2
	var Diff = num1 - num2
	var Abs = abs(Diff)
	var Max = 0
	var Min = 0
	if num1 > num2:
		Max = num1
	else:
		Max = num2
		
	if Max == num1:
		Min = num2
	else:
		Min = num1
	$output.text = "Sum = " + str(Sum) + \
					"\nDifference = " + str(Diff) + \
					"\nAbs. Distance = " +str(Abs) + \
					"\nMax = " + str(Max) + \
					"\nMin = " + str(Min)
					



func _on_btn_clear_pressed():
	$enter_num1.text = ""
	$enter_num2.text = ""
	$output.text = ""
	


func _on_btn_exit_pressed():
	get_tree().quit()
