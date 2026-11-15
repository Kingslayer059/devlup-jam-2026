class_name Interactable
extends Node2D

func _enter_tree() -> void:
	add_to_group("interactables")

func is_in_reach(_player: Player) -> bool:
	return false;

func interact() -> void:
	pass;
