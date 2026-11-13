extends Node2D



@onready var bar1 = $"Line Canvas/Player 1"
@onready var gr1 = $"Line Canvas/Player 1/GreenIndicator1"
@onready var needle1 = $"Line Canvas/P1 Line"

@onready var bar2 = $"Line Canvas/Player 2"
@onready var gr2 = $"Line Canvas/Player 2/GreenIndicator2"
@onready var needle2 = $"Line Canvas/P2 Line"



var player1 = 0
var player2 = 0
var speed = 300
var d1 = 1
var d2 = 2
var width = 400

func _ready():
	$"Line Canvas/P1 Score".text = player1
	$"Line Canvas/P2 Score".text = player2
	resetm1m2()


func _process(delta: float):
	needle1.position.x += speed * d1 * delta
	if needle1.position.x >= bar1.position.x + width:
		d1 = -1
	elif needle1.position.x <= bar1.position.x - width:
		d1 = 1
	
	needle2.position.x += speed * d2 * delta
	if needle2.position.x >= bar2.position.x + width:
		d2 = -1
	elif needle2.position.x <= bar2.position.x - width:
		d2 = 1

func _unhandled_input(event: InputEvent):
	var green1min = bar1.position.x + gr1.position.x - (gr1.scale.x * 50)
	var green1max = bar1.position.x + gr1.position.x + (gr1.scale.x * 50)
	if event.is_action("Player 1"):
		if needle1.position.x >= green1min and needle1.position.x <= green1max:
			var tween = get_tree().create_tween()
			tween.tween_property(gr1 , "scale" , Vector2(1.1 , 1.1), .1)
			player1 += 1
			$"Line Canvas/P2 Score".text = player1
			tween.tween_property(gr1 , "scale" , Vector2(1 , 1), .1)
	
	var green2min = bar2.position.x + gr2.position.x - (gr2.scale.x * 50)
	var green2max = bar2.position.x + gr2.position.x + (gr2.scale.x * 50)
	if event.is_action("Player 2"):
		if needle2.position.x >= green2min and needle2.position.x <= green2max:
			var tween = get_tree().create_tween()
			tween.tween_property(gr2 , "scale" , Vector2(1.1 , 1.1) , .1)
			player2 += 1
			$"Line Canvas/P2 Score".text = player2
			tween.tween_property(gr2 , "scale", Vector2(1,1) , .1)



func resetmark1():
	var x1 = randi_range(1 , 2)
	if x1 == 1:
		d1 = 1
	elif x1 == 2:
		d1 = -1
	gr1.scale.x = randf_range(0.3 , 1.0)
	gr1.position.x = randf_range(-width + 50 , -width - 50)


func resetmark2():
	var x2 = randi_range(1 , 2)
	if x2 == 1:
		d2 = 1
	elif x2 == 2:
		d2 = -1
	gr2.scale.x = randf_range(0.3 , 1.0)
	gr2.position.x = randf_range(-width + 50 , -width -50)


func resetm1m2():
	resetmark1()
	resetmark2()
