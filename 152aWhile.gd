extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

	


func _on_btn_calc_pressed():
	var Sum = 0
	var lcv = 3 #loop control variable
	while lcv <= 9669:
		Sum += lcv
		$ItemList.add_item(str(Sum))
		lcv +=3
