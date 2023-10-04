extends Control
var num1 = 0
var num2 = 0
func getnums():
	num1 = int($txt_num1.text)
	num2 = int($txt_num2.text)
func sub(): num1 - num2
func mul(): num1 * num2
func div(): num1 / num2
func power(): num1 ** num2


func _on_btn_clear_pressed():
	$txt_num1.text = ""
	$txt_num2.text = ""
	$output.text = ""
	
func _on_btn_exit_pressed():
	get_tree().quit()
	


func _on_btn_add_pressed():	
	getnums()
	$output.text = 
	return
func _on_btn_sub_pressed(): pass
func _on_btn_mul_pressed():  pass
func _on_btn_mod_pressed(): pass
func _on_btn_pow_pressed(): pass
