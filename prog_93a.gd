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
	var killowats = float($txt_killowats.text)
	var baserate = killowats * 0.0475
	var surcharge = baserate * .1
	var citytax = baserate * 0.3
	var total = baserate + surcharge + citytax
	$amt_owed.text = "baserate: $%.2f" %(baserate) + "surcharge: $%.2f" %(surcharge) + "citytax: $%.2f" %(citytax)
	var lt = total * 1.04
	
	
