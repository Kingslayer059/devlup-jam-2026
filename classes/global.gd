extends Node

signal player_carry(item: Interactable, scene: PackedScene)
signal player_plant

var player: Player
var is_present: bool
var collected_collectibles: int = 0
