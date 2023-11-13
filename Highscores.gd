extends Control
var highscores = []


func update_scorebaord():
	$ItemList.clear() #captiol in python
	highscores.sort()
	# for score in highscores:
		# $ItemList.add_item(str(score))
	for index in range(len(highscores)):
		$ItemList.add_item("%d. %d" % [index+1, highscores[index]])
	
	
	
func _ready():
	update_scorebaord()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	var score = int($LineEdit.text)
	highscores.append(score)
	update_scorebaord()


func _on_button_2_pressed():
	var position = int($LineEdit2.text) -1
	highscores.remove_at(position)
	update_scorebaord()
