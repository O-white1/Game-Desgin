extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_button_pressed():
	#rqandom num (min, max) = randi() %
	var len = randi() % (13-1) + 1 # (1-12) random numbr.
	var wid = randi() % (23-2) +2 # 2-22 random number
	var area = len *wid
	var rnd = randf() # 0.0- 0.9999999999999999999999999999999
	var rand2 =  randf_range(-5., 5.) # 5.0, 5.0)
	# %d means int, %f means float,  %#f, means round to # decimals (%.2f)
	# /n means new line. /t means tab space
	$label.text = "Len: %d\nWid: %d\nArea: %d\Rnd1: %f\nRnd2: %f" \
					% [len, wid, area, rnd1, rnd2]
