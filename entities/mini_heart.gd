extends BaseItem

func _init(): super._init(5)
func ready(): super._ready()

func interact(player):
	player.pickup_health(value)
	remove()
