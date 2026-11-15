class_name Seed
extends Item

@export_enum("vines", "maple_tree", "pumpkin") var plant_type: String

var planted := false

func interact() -> void:
	if !planted:
		super()
		planted = true
