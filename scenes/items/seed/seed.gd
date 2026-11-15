class_name Seed
extends Item

var planted := false

func interact() -> void:
	if !planted:
		super()
		planted = true
