extends Node2D

@onready var audio_stream_player: AudioStreamPlayer = %AudioStreamPlayer
@onready var audio_stream_player_sfx: AudioStreamPlayer2D = %AudioStreamPlayerSFX
@onready var audio_stream: AudioStreamSynchronized = audio_stream_player.stream
@onready var clock_forward: AudioStream = preload("res://sfx/clockforwardnopitch.mp3")
@onready var clock_backward: AudioStream = preload("res://sfx/clockbackwardnopitch.mp3")

var volume_on: int = 0 # range is from -60 (silent) to 0 (full volume)
var volume_off: int = -60
var switch_duration: float = 1.5

func _ready() -> void:
	Global.time_swap_initiated.connect(_on_time_swap_initiated)
	audio_stream.set_sync_stream_volume(0, volume_on) # start w present theme playing
	audio_stream.set_sync_stream_volume(1, volume_off)

func _on_time_swap_initiated() -> void:
	var fade_in: Tween = create_tween()
	var fade_out: Tween = create_tween()
	if Global.is_present == true:
		fade_out.tween_method(
			func(value: float) -> void: audio_stream.set_sync_stream_volume(1, value), 0.0, -60.0, switch_duration)
		fade_in.tween_method(
			func(value: float) -> void: audio_stream.set_sync_stream_volume(0, value), -60.0, 0.0, switch_duration)
		
		audio_stream_player_sfx.stream = clock_forward
		audio_stream_player_sfx.play()
	else:
		fade_out.tween_method(
			func(value: float) -> void: audio_stream.set_sync_stream_volume(0, value), 0.0, -60.0, switch_duration)
		fade_in.tween_method(
			func(value: float) -> void: audio_stream.set_sync_stream_volume(1, value), -60.0, 0.0, switch_duration)
		
		audio_stream_player_sfx.stream = clock_backward
		audio_stream_player_sfx.play()
