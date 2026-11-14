extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	player.direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		player.direction += Vector2.LEFT
	if Input.is_action_pressed("move_right"):
		player.direction += Vector2.RIGHT
	
	player.velocity.x = player.direction.x * player.speed
