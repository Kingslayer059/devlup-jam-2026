extends Node

signal player_carry(item: Interactable, scene: PackedScene)
signal player_plant
signal time_swap_initiated

var player: Player
var is_present: bool
