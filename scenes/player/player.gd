class_name Player
extends CharacterBody2D

@export var speed := 400
@export var jump_speed := 800
@export var gravity := 60

@onready var interact: Area2D = %Interact
@onready var climbing: Area2D = %Climbing

var is_carrying := false
var is_climbing := false
var direction: Vector2: 
	set(_direction):
		direction = _direction
		if direction != Vector2.ZERO:
			last_direction = direction
	get:
		return direction
var last_direction := Vector2.ZERO
var current_item: Item
var current_climb_position: Vector2

func _ready() -> void:
	Global.player = self
	Global.player_carry.connect(on_player_carry)
	Global.player_plant.connect(on_player_plant)

func _physics_process(_delta: float) -> void:
	if !is_on_floor() && !is_climbing:
		velocity.y += gravity
	
	move_and_slide()
	
	if last_direction == Vector2.RIGHT:
		interact.position.x = abs(interact.position.x)
	if last_direction == Vector2.LEFT:
		interact.position.x = -abs(interact.position.x)
	
	if Input.is_action_just_pressed("climb_up") && !is_climbing:
		var areas := interact.get_overlapping_areas()
		if areas.size() > 0:
			for area in areas:
				if area is Vines:
					var interactable: Vines = area as Vines
					interactable.interact()
	
	if Input.is_action_just_pressed("interact"):
		var areas := interact.get_overlapping_areas()
		if areas.size() > 0:
			for area in areas:
				if area is Interactable && area is not Vines:
					var interactable: Interactable = area as Interactable
					interactable.interact()
	

func on_player_carry(item: Item, scene: PackedScene) -> void:
	if is_carrying:
		return
	is_carrying = true
	item.queue_free()
	get_node(item.get_path())

	var new_item: Item = scene.instantiate()
	add_child(new_item)
	new_item.position = Vector2(0, -20)
	current_item = new_item

func on_player_plant() -> void:
	is_carrying = false
