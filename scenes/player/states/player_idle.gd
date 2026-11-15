extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	if player.last_direction == Vector2.LEFT:
		player.sprite.flip_h = false
	if player.last_direction == Vector2.RIGHT:
		player.sprite.flip_h = true
	player.animation_player.play("idle")
