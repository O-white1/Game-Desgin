extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_btn_calc_pressed():	
	var rad = float($Txt_Rad.text)
	var area = PI * pow(rad, 2) #This is rad sqaured ^2
	var circ = 2 * PI * rad #This is the equasion for Circumphrance.
	$output.text = "Area:" +str(area)


func _on_btn_clear_pressed():
	$output.text = ""


func _on_btn_exit_pressed():
	get_tree().quit()
