extends Interactable

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
	
	if Global.player.is_carrying and Global.player.current_item is Seed:
		Global.player_plant.emit()
		var seed_item: Seed = Global.player.current_item as Seed
		seed_item.queue_free()
		
		var new_seed: Seed = seed_item.seed_scene.instantiate()
		new_seed.planted = true
		planted = true
		add_child(new_seed)
		
		seed = new_seed
	
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
