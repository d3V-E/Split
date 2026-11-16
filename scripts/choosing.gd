extends Node2D


@onready var game1 = $"Main Game Canvas/Game 1"
@onready var game2 = $"Main Game Canvas/Game 2"
@onready var instruct = $"Main Game Canvas/Instructions"
@onready var game3 = $"Main Game Canvas/Game 3"
@onready var p1add = $"Main Game Canvas/p1+"
@onready var p2add = $"Main Game Canvas/p2+"
@onready var reset : TextureButton = $"Main Game Canvas/Reset"
@onready var game4 = $"Main Game Canvas/Game 4"


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
	game2.pivot_offset = game2.size / 2
	game3.pivot_offset = game3.size / 2
	p1add.pivot_offset = p1add.size / 2
	p2add.pivot_offset = p2add.size / 2
	reset.pivot_offset = reset.size / 2
	game4.pivot_offset = game4.size / 2
	$"Main Game Canvas/p1score".text = str(p1)
	$"Main Game Canvas/p2score".text = str(p2)






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
	get_tree().change_scene_to_file("res://scenes/instructions.tscn")





func _on_game_2_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(game2 , "scale" , Vector2(.9 ,.9) , .1)





func _on_game_2_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(game2 , "scale" , Vector2(1 , 1), .1)
	get_tree().change_scene_to_file("res://scenes/line_click.tscn")






func _on_game_3_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(game3 , "scale" , Vector2(.9 ,.9), .1)





func _on_game_3_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(game3 , "scale" , Vector2(1 , 1), .1)
	get_tree().change_scene_to_file("res://scenes/quick_draw.tscn")



func p1win():
	p1 += 1
	emit_signal("p1_changed")


func p2win():
	p2 += 1
	emit_signal("p2_changed")






func _on_p_1_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(p1add , "scale" , Vector2(.9 ,.9), .1)





func _on_p_1_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(p1add , "scale" , Vector2(1 , 1), .1)
	p1 += 1
	$"Main Game Canvas/p1score".text = str(p1)
	emit_signal("p1_changed")
	save_data()





func _on_p_2_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(p2add , "scale" , Vector2(.9 ,.9), .1)




func _on_p_2_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(p2add , "scale" ,Vector2(1 , 1), .1)
	p2 += 1
	$"Main Game Canvas/p2score".text = str(p2)
	emit_signal("p2_changed")
	save_data()





func _on_reset_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(reset , "scale" , Vector2(.9 ,.9), .1)






func _on_reset_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(reset , "scale" , Vector2(1 , 1) ,.1)
	p1 = 0
	p2 = 0
	emit_signal("p1_changed")
	emit_signal("p2_changed")
	save_data()
	$"Main Game Canvas/p1score".text = str(p1)
	$"Main Game Canvas/p2score".text = str(p2)







func _on_game_4_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(game4 , "scale" , Vector2(.9 ,.9), .1)





func _on_game_4_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(game4 , "scale" , Vector2(1 ,1) ,.1)
	get_tree().change_scene_to_file("res://scenes/spam.tscn")
