class_name Player
extends CharacterBody2D

@export var speed := 400
@export var jump_speed := 800
@export var gravity := 60

func _physics_process(_delta: float) -> void:
	if !is_on_floor():
		velocity.y += gravity
	
	move_and_slide()
