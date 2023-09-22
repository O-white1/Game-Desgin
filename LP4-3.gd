extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():
	var eggs = int($txteggs.text)
	var dozens = floor(eggs / 12)
	var remainder = eggs % 12
	var price = 0.0
	
	if dozens > 0 and dozens <= 4:
		price = .50
	elif dozens > 4 and dozens <= 6:
		price = .45
	elif dozens > 6 and dozens <= 11:
		price = 0.40
	elif dozens > 11:
		price = .35
	var totalcost = (price * dozens) + (remainder * (price/12))
	$output.text = "price is %.2f" % totalcost + "\nprice per egg: $%.2f" % price
	
	
	


func _on_btn_clear_pressed():
	$output.text = ""
	$txteggs.text = ""
	
	


func _on_btn_exit_pressed():
	get_tree().quit()
