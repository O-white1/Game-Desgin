extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_2_pressed():
	var num1 = int($LineEdit.text)
	var num2 = int($lineEdit2.text)
	var num3 = int($lineEdit3.text)
	var num4 = int($lineEdit4.text)
	var sum = num1 + num2 + num3 + num4
	
	$label2.text = "sum"
