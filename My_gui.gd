extends Control

func _ready():
	pass
func _process(delta):
	self.process_mode = Node.PROCESS_MODE_ALWAYS

func _on_quit_pressed():
	get_tree().quit()


func _on_resume_pressed():
	hide()
	get_tree().paused = false
	
