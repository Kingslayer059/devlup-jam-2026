extends Node2D

@export var past: Node2D
@export var present: Node2D

@export var past_tileset: TileMapLayer
@export var present_tileset: TileMapLayer

func _ready() -> void:
	Global.is_present = true

func _physics_process(_delta: float) -> void:
	if Input.is_action_just_pressed("time_swap"):
		if present.is_visible_in_tree():
			past.visible = true
			past_tileset.collision_enabled = true
			
			present.visible = false
			present_tileset.collision_enabled = false
			
			Global.is_present = false
			Global.change_to_past.emit()
		elif past.is_visible_in_tree():
			present.visible = true
			present_tileset.collision_enabled = true
			
			past.visible = false
			past_tileset.collision_enabled = false
			
			Global.is_present = true
			Global.change_to_present.emit()
