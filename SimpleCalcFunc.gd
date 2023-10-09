extends Control
var num1 = 0
var num2 = 0
func getnums():
	num1 = int($txt_num1.text)
	num2 = int($txt_num2.text)
func _on_btn_clear_pressed():
	$txt_num1.text = ""
	$txt_num2.text = ""
	$output.text = ""
	$txt_num1.text = ""
	$txt_num2.text = ""
	$output.text = ""
func _on_btn_exit_pressed():
		get_tree().quit()

func _on_btn_add_pressed():	
	getnums()
	var add = num1 + num2
	$output.text = str(add)
	
func _on_btn_sub_pressed():
	getnums()
	var sub = num1 - num2
	$output.text = str(sub)
func _on_btn_mul_pressed():
	getnums()
	var mul = num1 * num2
	$output.text = str(mul)
func _on_btn_mod_pressed():
	getnums()
	var mod = num1 % num2
	$output.text = str(mod)
func _on_btn_pow_pressed():
	getnums()
	var pow = num1 ** num2
	$output.text = str(pow)
func _on_btn_div_pressed():
	getnums()
	var div = num1 / num2
	$output.text = str(div)
