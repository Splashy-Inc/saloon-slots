extends Node2D

class_name StopButton

signal stop_pressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_texture_button_pressed() -> void:
	$AnimatedSprite2D.play("pressed")
	stop_pressed.emit()
	$Button.disabled = true

func reset():
	$AnimatedSprite2D.play("default")
	$Button.disabled = false
