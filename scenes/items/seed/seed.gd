class_name Seed
extends Item

@onready var seed_scene: PackedScene = preload("res://scenes/items/seed/seed.tscn")

var planted := false

func interact() -> void:
	if !planted:
		Global.player_carry.emit(self, seed_scene)
