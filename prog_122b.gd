extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_exit_pressed():
	get_tree().quit()


func _on_btn_clear_pressed():
	$ItemList.clear()
	


func _on_btn_calc_pressed():
	$ItemList.add_item("Number")
	for num in range(1, 40,):
		var line = "%d" % num
		"%d" % int(num * 4)
		$ItemList.add_item(line)
		
