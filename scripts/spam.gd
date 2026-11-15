extends Node2D

@onready var timer:Timer = $Canvas/Timer

var p1click = 0
var p2click = 0
var clickallow = false

func _ready():
	clickallow = false
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	await get_tree().create_timer(1).timeout
	clickallow = true
	timer.start()

func _input(event: InputEvent):
	if event.is_action_pressed("Player 1") and clickallow == true:
		p1click += 1
	if event.is_action_pressed("Player 2") and clickallow == true:
		p2click += 1




func _on_timer_timeout():
	clickallow = false
