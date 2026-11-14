class_name Collectible
extends Item

var collected : bool

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(on_player_touch)
	collected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func on_player_touch(body: Node2D) -> void:
	if body is Player:
		collected = true
		hide()
	
	
