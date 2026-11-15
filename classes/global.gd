extends Node

signal player_carry(item: Interactable, scene: PackedScene)
signal player_climb(climb_position: Vector2)
signal change_to_present
signal change_to_past
signal time_swap_initiated
signal time_swap_finished

var player: Player
var is_present: bool
var collected_collectibles: int = 0
