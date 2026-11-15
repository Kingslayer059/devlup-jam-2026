extends Node

signal feather_collect

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	feather_collect.connect(_on_feather_collect)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_feather_collect() -> void:
	print("ON FEATHER COLLECT")
	var level_number: int = Global.collected_collectibles + 1;
	print("collected: %d" % Global.collected_collectibles)
	print("level number: %d" % level_number)
	get_tree().change_scene_to_file("res://scenes/levels/level%d.tscn" % level_number)
