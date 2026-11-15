extends ShapedInteractable

@export var plant: Node2D

var seed: Seed
var planted := false

func _ready() -> void:
	Global.change_to_present.connect(on_change_to_present)
	Global.change_to_past.connect(on_change_to_past)
	if plant == null:
		printerr("No plant assigned")

func interact() -> void:
	if Global.is_present:
		return
	
	if Global.player.current_item is Seed:
		var seed_item: Seed = Global.player.current_item as Seed
		seed_item.queue_free()
		
		var seed_scene: PackedScene = load(seed_item.scene_file_path);
		var new_seed: Seed = seed_scene.instantiate();
		new_seed.planted = true
		planted = true
		add_child(new_seed)
		seed = new_seed
		Global.player.current_item = null

func on_change_to_present() -> void:
	if !planted:
		return
	plant.visible = true
	seed.visible = false

func on_change_to_past() -> void:
	if !planted:
		return
	plant.visible = false
	seed.visible = true
