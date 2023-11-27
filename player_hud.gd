extends CanvasLayer

@onready var player = get_tree().get_first_node_in_group("Player")
@onready var hearts = $PlayerHealth/Hearts

const HEART_ROW_SIZE = 10
const HEART_OFFEST = 16

func create_heart():
	var n_heart = Sprite2D.new()
	n_heart.texture = hearts.texture
	n_heart.hframes = hearts.hframes
	n_heart.vframes = hearts.vframes
	n_heart.frame = 8
	hearts.add_child(n_heart)
	
func draw_hearts():
	for heart in hearts.get_children():
		hearts.remove_child(heart)
	for i in range(int(player.data.max_health) / 20):
		create_heart()  # one heart per 20 HP
	


func _ready():
	draw_hearts()
	pass
	
	
	
func _process(delta):
	var p_health = player.data.health
	var full_hearts = floor(p_health / 20)
	var remainder = int(p_health) % 20
	$Money.text = player.data.money
	
	
	for heart in hearts.get_children():
		var index = heart.get_index()
		var x = (index % HEART_ROW_SIZE) * HEART_OFFEST
		var y = (index / HEART_ROW_SIZE) * HEART_OFFEST
		heart.position = Vector2(x, y)
		if index > full_hearts:
			heart.frame = 8
		elif index == full_hearts: 
			heart.frame = 8 - int(remainder / 5)
		elif index < full_hearts:
			heart.frame = 4
	pass
	
	
	
