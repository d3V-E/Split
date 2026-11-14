extends Node2D


@onready var game1 = $"Main Game Canvas/Game 1"
@onready var instruct = $"Main Game Canvas/Instructions"

const save_path = "user://userdata.save"


var p1 = 0
var p2 = 0



signal p1_changed
signal p2_changed


func save_data():
	var data = {
		"p1" : p1,
		"p2" : p2
	}
	var file = FileAccess.open(save_path , FileAccess.WRITE)
	file.store_var(data)
	file.close()


func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path , FileAccess.READ)
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			p1 = data.get("p1" , 0)
			p2 = data.get("p2" , 0)
	else:
		save_data()

func _ready():
	load_data()
	game1.pivot_offset = game1.size / 2
	instruct.pivot_offset = instruct.size / 2







func _on_game_1_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(game1 , "scale" , Vector2(.9 ,.9), .1)





func _on_game_1_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(game1 , "scale" , Vector2(1 , 1), .1)
	get_tree().change_scene_to_file("res://scenes/timer_game.tscn")





func _on_instructions_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(instruct , "scale" , Vector2(.9 ,.9), .1)





func _on_instructions_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(instruct , "scale" , Vector2(1 , 1), .1)
