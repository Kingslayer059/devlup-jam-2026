class_name Vines
extends Interactable

func interact() -> void:
	if !Global.is_present:
		return
	Global.player_climb.emit(global_position)
