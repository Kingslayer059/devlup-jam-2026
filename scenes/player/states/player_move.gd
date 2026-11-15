extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	player.direction = Vector2.ZERO
	
	if Input.is_action_pressed("move_left"):
		player.direction += Vector2.LEFT
		player.animation_player.play("run")
		player.sprite.flip_h = false
	if Input.is_action_pressed("move_right"):
		player.direction += Vector2.RIGHT
		player.animation_player.play("run")
		player.sprite.flip_h = true
	
	if !player.is_on_floor() && !player.animation_player.is_playing():
		player.animation_player.play("fall")
	
	player.velocity.x = player.direction.x * player.speed
