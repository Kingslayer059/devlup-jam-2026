extends ShapedInteractable

func interact() -> void:
	if Global.player.is_carrying and Global.player.current_item is KeyItem:
		Global.player.current_item.queue_free();
		queue_free();
