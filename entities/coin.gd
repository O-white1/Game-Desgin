extends BaseItem

func _init(): super._init(1)
func ready(): super._ready()

func interact(player):
	player.pickup_money(value)
	player.data.money + 1
	remove()
