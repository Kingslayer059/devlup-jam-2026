extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var audio_stream: AudioStreamSynchronized = audio_stream_player.stream
var volume_on: int = 0 # range is from -60 (silent) to 0 (full volume)
var volume_off: int = -60

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Global.time_swap_initiated.connect(_on_time_swap_initiated)
	audio_stream.set_sync_stream_volume(0, volume_on) # start w present theme playing
	audio_stream.set_sync_stream_volume(1, volume_off)
	pass # Replace with function body.

func _on_time_swap_initiated() -> void:
	print("entered")
	if Global.is_present == true:
		audio_stream.set_sync_stream_volume(0, volume_on)
		audio_stream.set_sync_stream_volume(1, volume_off)
	else:
		audio_stream.set_sync_stream_volume(1, volume_on)
		audio_stream.set_sync_stream_volume(0, volume_off)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
