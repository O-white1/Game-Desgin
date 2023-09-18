extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var copies = int($txt_copies.text)
	var price = 0.0 #price per copy
	var cost = 0.0 #total cost
	if copies > 0 and copies <= 99:
		price = 0.30
	elif copies > 99 and copies <= 499:
		price = 0.28
	elif copies > 499 and copies <= 749:
		price = 0.27
	elif copies > 749 and copies <=100:
		price = 0.26
	elif copies > 1000:
		price = 0.25
	else:
		$lbl_out.text = "Invalid number of copies"
		return
	cost = price * copies
	$lbl_out.text = "Price per copy is $" + str(price) + "\nTotal cost is $%.2f" % cost
	


func _on_btn_clear_pressed():
	$lbl_out.text = ""
	$txt_copies.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
