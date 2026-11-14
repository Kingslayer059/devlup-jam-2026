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
	var new_state: State = state;
	if !player.is_climbing:
		if Input.is_action_pressed("jump") && player.is_on_floor():
			new_state = jump_state;
		elif Input.is_action_pressed("move") || player.velocity != Vector2.ZERO:
			new_state = move_state;
		else:
			new_state = idle_state;
	elif Input.is_action_pressed("jump"):
		new_state = jump_state;
	if (new_state != state):
		change_state(new_state);

func on_player_climb(climb_position: Vector2) -> void:
	if player.is_carrying:
		return
	player.is_climbing = true
	player.current_climb_position = climb_position
	change_state(climb_state)
