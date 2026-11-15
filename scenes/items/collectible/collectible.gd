class_name Collectible
extends Area2D

var collected : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_player_touch(body: Node2D) -> void:
	if body is Player:
		Global.collected_collectibles += 1
		queue_free()


func _on_body_entered(body: Node2D) -> void:
	Global.collected_collectibles += 1
	GameManager.feather_collect.emit()
	print("ON BODY ENTERED")
