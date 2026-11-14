extends Item

@onready var seed_scene: PackedScene = preload("res://scenes/items/seed/seed.tscn")

func interact() -> void:
	Global.player_carry.emit(self, seed_scene)
