extends StateMachine

@export var player: Player

@onready var idle_state: State = %Idle
@onready var move_state: State = %Move
@onready var jump_state: State = %Jump
@onready var climb_state: State = %Climb

func _ready() -> void:
	change_state(state)
	Global.player_climb.connect(on_player_climb)

func _physics_process(_delta: float) -> void:
	if !player.is_climbing:
		if Input.is_action_pressed("jump") && player.is_on_floor():
			change_state(jump_state)
		elif Input.is_action_pressed("move") || player.velocity != Vector2.ZERO:
			change_state(move_state)
		else:
			change_state(idle_state)
	if player.is_climbing:
		if Input.is_action_pressed("jump"):
			change_state(jump_state)

func on_player_climb(climb_position: Vector2) -> void:
	if player.current_item != null:
		return
	player.is_climbing = true
	player.current_climb_position = climb_position
	change_state(climb_state)
