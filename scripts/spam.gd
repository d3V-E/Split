extends Node2D

@onready var timer:Timer = $Canvas/Timer
@onready var winnertext = $Canvas/Winner

var p1click = 0
var p2click = 0
var clickallow = false

func _ready():
	winnertext.visible = false
	clickallow = false
	$Canvas/Counter.text = "3"
	await get_tree().create_timer(1).timeout
	$Canvas/Counter.text = "2"
	await get_tree().create_timer(1).timeout
	$Canvas/Counter.text = "1"
	await get_tree().create_timer(1).timeout
	$"Canvas/Counter".text = "GO"
	clickallow = true
	timer.start()

func _input(event: InputEvent):
	if event.is_action_pressed("Player 1") and clickallow == true:
		p1click += 1
		$"Canvas/Player score 1".text = str(p1click)
	if event.is_action_pressed("Player 2") and clickallow == true:
		p2click += 1
		$"Canvas/Player score 2".text = str(p2click)




func _on_timer_timeout():
	clickallow = false
	winnertext.visible = true
	if p1click > p2click:
		$Canvas/Winner.text = "PLAYER 1 WINS"
	if p2click < p1click:
		$Canvas/Winner.text = "PLAYER 2 WINS"
	if p1click == p2click:
		$Canvas/Winner.text = "TIE"
	await get_tree().create_timer(3).timeout
	get_tree().change_scene_to_file("res://scenes/main_game.tscn")
