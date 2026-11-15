extends Camera2D

#@onready var time_swap: TimeSwap = $TimeSwap

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#time_swap.time_swap_anim_start.connect(_on_time_swap_time_swap_anim_start)
	pass # Replace with function body

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_time_swap_time_swap_anim_start() -> void:
	pass # Replace with function body.
