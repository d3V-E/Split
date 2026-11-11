extends Node2D


@onready var timer = $"Timer Game Canvas/Timer/Timer Check"
@onready var animationtimer = $"Timer Game Canvas/Timer/Animation Timer"
@onready var timerunit = $"Timer Game Canvas/Timer"
@onready var countdowntag = $"Timer Game Canvas/Background/Countdown"

var timestop = 0
var timestopper = 0

func _ready():
	timerunit.visible = false
	countdowntag.visible = true
	countdowntag.text = "3"
	await get_tree().create_timer(1).timeout
	countdowntag.text = "2"
	await get_tree().create_timer(1).timeout
	countdowntag.text = "1"
	await get_tree().create_timer(1).timeout
	countdowntag.text = "GO !"
	countdowntag.visible = false
	timerunit.visible = true
	timestop = randf_range(3 , 20)
	timestopper = (timestop * 1000)
	
