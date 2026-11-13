extends Node2D


@onready var bullet1 = $"Canvas/Bullet 1"
@onready var bullet2 = $"Canvas/Bullet 2"
@onready var anim = $Canvas/Anim

var fired = false
var drawallow = false

func _ready():
	bullet1.visible = false
	bullet2.visible = false
	anim.play("RESET")


func _input(event: InputEvent):
	if event.is_action_pressed("Player 1") and fired == false and drawallow == true:
		bullet1.visible = true
		fired = true
		bullet2.visible = false
		anim.play("P1")
	if event.is_action_pressed("Player 2") and fired == false and drawallow == true:
		bullet2.visible = true
		fired = true
		bullet1.visible = false
		anim.play("P2")
