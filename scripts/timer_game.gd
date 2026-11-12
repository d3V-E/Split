extends Node2D


@onready var timer = $"Timer Game Canvas/Timer/Timer Check"
@onready var animationtimer = $"Timer Game Canvas/Timer/Animation Timer"
@onready var timerunit = $"Timer Game Canvas/Timer"
@onready var countdowntag = $"Timer Game Canvas/Background/Countdown"
@onready var finisher = $"Timer Game Canvas/Finish Animation"


var timestop = 0
var timestopper = 0
var playeronecount = 0
var playertwocount = 0
var playeroneclicked = false
var playertwoclicked = false
var currenttime = 0
var dropped = false


func _ready():
	finisher.play_backwards("Finish")
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
	timestop = randi_range(3 , 15)
	timestopper = (timestop * 100)
	@warning_ignore("integer_division")
	var sec = (timestopper / 100)
	var centi = timestopper % 100
	$"Timer Game Canvas/Timer/Timer".text = "%02d : %02d" % [sec , centi]
	await get_tree().create_timer(3).timeout
	animationtimer.play("Drop Down")
	timer.start()
	










func _on_timer_check_timeout():
	currenttime += 1
	if playeroneclicked == true and playertwoclicked == true and dropped == false :
		animationtimer.play_backwards("Drop Down")
		finisher.play("Finish")
		@warning_ignore("integer_division")
		var p1sec = (playeronecount / 100)
		var p1centi = playeronecount % 100
		$"Timer Game Canvas/Player1/Player1 Text".text = "%02d : %02d" % [p1sec , p1centi]
		@warning_ignore("integer_division")
		var p2sec = (playertwocount / 100)
		var p2centi = playertwocount % 100
		$"Timer Game Canvas/Player2/Player2 Text".text = "%02d : %02d" % [p2sec , p2centi]
		dropped = true
		var p1diff = abs(playeronecount - timestopper)
		var p2diff = abs(playertwocount - timestopper)
		if p1diff < p2diff:
			$"Timer Game Canvas/Player1/Player1 Text".add_theme_color_override("font_outline_color" , Color.GREEN)
			$"Timer Game Canvas/Player2/Player2 Text".add_theme_color_override("font_outline_color" , Color.RED)
		elif p1diff > p2diff:
			$"Timer Game Canvas/Player1/Player1 Text".add_theme_color_override("font_outline_color" , Color.RED)
			$"Timer Game Canvas/Player2/Player2 Text".add_theme_color_override("font_outline_color" , Color.GREEN)



func _input(event: InputEvent):
	if event.is_action_pressed("Player 1"):
		if playeroneclicked == false:
			playeronecount = currenttime
			playeroneclicked = true
	if event.is_action_pressed("Player 2"):
		if playertwoclicked == false:
			playertwocount = currenttime
			playertwoclicked = true
