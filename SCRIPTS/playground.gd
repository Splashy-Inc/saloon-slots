extends Node

@onready var spinner_1: Spinner = $MiddleRow/Spinners/Spinner
@onready var spinner_2: Spinner = $MiddleRow/Spinners/Spinner2
@onready var spinner_3: Spinner = $MiddleRow/Spinners/Spinner3
@onready var score_label: Label = $TopRow/ScoreBox/ScoreRow/ScoreLabel
@onready var lever: Lever = $MiddleRow/Lever/Lever

const SCORE_INCREMENT = 100
var score = 0
var stopped_spinners : Array[Spinner]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_stop_one_pressed() -> void:
	spinner_1.stop()

func _on_stop_two_pressed() -> void:
	spinner_2.stop()

func _on_stop_three_pressed() -> void:
	spinner_3.stop()

func _on_spinner_stopped(stopped_spinner: Spinner) -> void:
	if not stopped_spinner in stopped_spinners:
		stopped_spinners.append(stopped_spinner)
	if len(stopped_spinners) == 3:
		if _check_spinner_lineup():
			score += SCORE_INCREMENT
			score_label.text = str(score)
		lever.reset()


func _check_spinner_lineup():
	var prev_position_y = null
	for spinner in stopped_spinners:
		if not prev_position_y:
			prev_position_y = int(spinner.get_icons_position().y)
		elif prev_position_y != int(spinner.get_icons_position().y):
			return false
	return true
func _on_lever_pulled() -> void:
	stopped_spinners = []
	spinner_1.start()
	spinner_2.start()
	spinner_3.start()
