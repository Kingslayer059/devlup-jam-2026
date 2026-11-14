class_name Item
extends Interactable

func interact() -> void:
	var scene: PackedScene = load(scene_file_path)
	Global.player_carry.emit(self, scene)

func is_in_reach(player: Player) -> bool:
	var circle: CircleShape2D = player.reach.shape
	return Geometry2D.is_point_in_circle(global_position, player.reach.global_position, circle.radius)
