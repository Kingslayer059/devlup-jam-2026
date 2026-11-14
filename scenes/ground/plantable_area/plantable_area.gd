extends ShapedInteractable

func interact() -> void:
	if Global.is_present:
		return
	
	if Global.player.is_carrying and Global.player.current_item is Seed:
		Global.player_plant.emit()
		var seed_item: Seed = Global.player.current_item as Seed
		seed_item.queue_free()
		
		var seed_scene: PackedScene = load(seed_item.scene_file_path);
		var new_seed: Seed = seed_scene.instantiate();
		new_seed.planted = true
		add_child(new_seed)
