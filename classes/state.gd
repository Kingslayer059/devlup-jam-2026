class_name State
extends Node

signal state_finished

func _ready() -> void:
	set_physics_process(false)

func _enter() -> void:
	set_physics_process(true)

func _exit() -> void:
	set_physics_process(false)
