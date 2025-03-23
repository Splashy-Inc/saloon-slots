extends Node

@export var playground_scene: PackedScene
@export var playground: Level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_play_button_pressed() -> void:
	$CanvasLayer.hide()

func _on_playground_reset_pressed() -> void:
	if playground:
		playground.queue_free()
		playground = null
	
	playground = playground_scene.instantiate()
	playground.reset_pressed.connect(_on_playground_reset_pressed)
	$GameScreen.add_child(playground)
