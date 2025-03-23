extends Node2D

class_name Lever

signal pulled

var is_pullable := true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_pressed() -> void:
	if is_pullable:
		is_pullable = false
		$AnimatedSprite2D.play("pull_down")
		$Pull.play()
		await $AnimatedSprite2D.animation_finished
		$Hit.play()
		pulled.emit()

func reset():
	$AnimatedSprite2D.play("reset")
	$Hit.play()
	await $AnimatedSprite2D.animation_finished
	$Pull.play()
	is_pullable = true
