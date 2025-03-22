extends Node2D

const MAX_SPEED = 360*2
var stopping := false
@onready var icons: Parallax2D = $Background/Icons

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	icons.autoscroll.y = MAX_SPEED
	stop()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(icons.global_position)
	if stopping and icons.autoscroll.y > 0:
		# Offset the icons based on the position before updating the autoscroll (WORKAROUND)
		# There is a known "issue" with the parallax resetting when autoscroll is updated,
		#   which has a solution in 4.4, which does not have a stable release as of writing:
		#   https://github.com/godotengine/godot/issues/97605
		var cur_position = icons.position
		
		icons.autoscroll.y = clamp(icons.autoscroll.y - 2, 0, MAX_SPEED) 
		$Background/Icons.scroll_offset.y = cur_position.y

func stop():
	stopping = true
