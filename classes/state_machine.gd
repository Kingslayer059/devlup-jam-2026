class_name StateMachine
extends Node

@export var state: State

func _ready() -> void:
	change_state(state)

func change_state(new_state: State) -> void:
	if new_state == state:
		return
	state._exit()
	state = new_state
	state._enter()
