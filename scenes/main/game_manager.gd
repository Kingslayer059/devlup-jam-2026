extends Node

signal feather_collect

func _ready() -> void:
	feather_collect.connect(_on_feather_collect)
	
func _on_feather_collect() -> void:
	print("ON FEATHER COLLECT")
	var level_number: int = Global.collected_collectibles + 1;
	print("collected: %d" % Global.collected_collectibles)
	print("level number: %d" % level_number)
	get_tree().call_deferred("change_scene_to_file", "res://scenes/levels/level%d.tscn" % level_number)
