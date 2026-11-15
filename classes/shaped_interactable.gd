class_name ShapedInteractable
extends Interactable

@onready var _shape: CollisionShape2D = $CollisionShape2D

func is_in_reach(player: Player) -> bool:
	return _shape.shape.collide(_shape.global_transform, player.reach.shape, player.reach.global_transform);
