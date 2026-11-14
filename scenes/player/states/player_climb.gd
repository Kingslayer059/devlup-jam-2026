extends State

@export var player: Player

func _physics_process(_delta: float) -> void:
	player.direction = Vector2.ZERO
	player.position.x = player.current_climb_position.x
	
	if Input.is_action_pressed("climb_up"):
		player.direction = Vector2.UP
	if Input.is_action_pressed("climb_down"):
		player.direction = Vector2.DOWN
	
	var areas := player.climbing.get_overlapping_areas()
	if !areas.size():
		if player.direction == Vector2.UP:
			player.direction = Vector2.ZERO
		
	
	player.velocity.y = player.direction.y * player.speed


func _exit() -> void:
	set_physics_process(false)
	player.is_climbing = false
