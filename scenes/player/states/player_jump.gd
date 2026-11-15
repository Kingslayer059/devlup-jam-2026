extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	player.velocity.y = -player.jump_speed
	player.animation_player.play("jump")
