extends Area2D

@onready var collision_shape: CollisionShape2D = $CollisionShape2D
@onready var particles: CPUParticles2D = $Particles
@onready var overlay: ColorRect = $CanvasLayer/Shader
@onready var zone_rect: ColorRect = $ZoneRect

@export var area_per_particle := 600.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var rect_size: Vector2 = (collision_shape.shape as RectangleShape2D).size;
	particles.position = collision_shape.position;
	particles.emission_rect_extents = rect_size / 2;
	particles.amount = maxi(1, roundi(rect_size.x * rect_size.y / area_per_particle));
	var outer_glow: float = (zone_rect.material as ShaderMaterial).get_shader_parameter("outer_glow")
	zone_rect.position = collision_shape.position - rect_size / 2 - Vector2(outer_glow, outer_glow)
	zone_rect.size = rect_size + Vector2(outer_glow, outer_glow) * 2

	particles.preprocess = particles.lifetime
	particles.visible = false
	particles.emitting = false;
	overlay.visible = false
	
	body_entered.connect(_on_body_entered);
	body_exited.connect(_on_body_exited);


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		var player: Player = body as Player;
		player.time_locked = true;
		set_effect(true);

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		var player: Player = body as Player;
		player.time_locked = false;
		set_effect(false);


func set_effect(on: bool) -> void:
	overlay.visible = on
	particles.visible = on
	if on:
		particles.restart()
	else:
		particles.emitting = false
