extends Node2D


@onready var bullet1 = $"Canvas/Bullet 1"
@onready var bullet2 = $"Canvas/Bullet 2"
@onready var anim = $Canvas/Anim
@onready var textvisible = $Canvas/Counter
@onready var header = $Canvas/Winner

var fired = false
var drawallow = false

func _ready():
	header.visible = false
	textvisible.visible = true
	bullet1.visible = false
	bullet2.visible = false
	anim.play("RESET")
	drawallow = false
	$Canvas/Counter.text = "3"
	await get_tree().create_timer(1).timeout
	$Canvas/Counter.text = "2"
	await get_tree().create_timer(1).timeout
	$Canvas/Counter.text = "1"
	await get_tree().create_timer(1).timeout
	$Canvas/Counter.text = "DRAW"
	drawallow = true
	textvisible.visible = false

func _input(event: InputEvent):
	if event.is_action_pressed("Player 1") and fired == false and drawallow == true:
		bullet1.visible = true
		fired = true
		bullet2.visible = false
		anim.play("P1")
		$Canvas/Winner.text = "PLAYER 1 WINS"
		header.visible = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	if event.is_action_pressed("Player 2") and fired == false and drawallow == true:
		bullet2.visible = true
		fired = true
		bullet1.visible = false
		anim.play("P2")
		$Canvas/Winner.text = "PLAYER 2 WINS"
		header.visible = true
		await get_tree().create_timer(3).timeout
		get_tree().change_scene_to_file("res://scenes/main_game.tscn")
