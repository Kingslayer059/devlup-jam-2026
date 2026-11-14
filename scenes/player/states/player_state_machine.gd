extends StateMachine

@export var player: Player

@onready var idle_state: State = %Idle
@onready var move_state: State = %Move
@onready var jump_state: State = %Jump

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("jump") && player.is_on_floor():
		change_state(jump_state)
	elif Input.is_action_pressed("move") || player.velocity != Vector2.ZERO:
		change_state(move_state)
	else:
		change_state(idle_state)
