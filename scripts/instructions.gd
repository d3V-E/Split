extends Node2D


@onready var next: TextureButton = $Canvas/Next
@onready var back:TextureButton = $Canvas/Previous
@onready var time = $Canvas/TimeHolder
@onready var needle = $Canvas/NeedleHolder
@onready var quick = $Canvas/QuickHolder



var page = 1

func _ready():
	next.pivot_offset = next.size / 2
	back.pivot_offset = back.size / 2
	s1()







func _on_next_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(next , "scale" , Vector2(.9 ,.9), .1)




func _on_next_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(next , "scale" , Vector2(1, 1), .1)
	page += 1
	if page == 2:
		s2()
	elif page == 3:
		s3()
	elif page == 4:
		s4()





func _on_previous_button_down():
	var tween = get_tree().create_tween()
	tween.tween_property(back , "scale", Vector2(.9 ,.9), .1)





func _on_previous_button_up():
	var tween = get_tree().create_tween()
	tween.tween_property(back , "scale" , Vector2(1 , 1), .1)
	page -= 1
	if page == 0:
		get_tree().change_scene_to_file("res://scenes/main_game.tscn")
	elif page == 1:
		s1()
	elif page == 2:
		s2()
	elif page == 3:
		s3()
	elif page == 4:
		s4()




func s1():
	time.visible = false
	needle.visible = false
	quick.visible = false
	next.visible = true
	$Canvas/Header.text = "INSTRUCTIONS"
	$Canvas/Info.text = "This is the instructions page which will explain the games in detail
To go to the next page click on the next arrow
To go back a page or to the game click the previous arrow
After winning a game wait 3 seconds for it to redirect you back to the main page

Controls
Player 1 = S 
Player 2 = K"



func s2():
	time.visible = true
	needle.visible = false
	quick.visible = false
	next.visible = true
	$Canvas/Header.text = "Timer Game"
	$Canvas/Info.text = "In this game there is a time given and the player who clicks their control nearest to the time given wins
The one with the least time difference wins
Do not click early or before the animation of the timer being hidden else it wont count or may result in a worse score"


func s3():
	time.visible = false
	needle.visible = true
	quick.visible = false
	next.visible = true
	$Canvas/Header.text = "Green Bar Game"
	$Canvas/Info.text = "Use the player controls to click when the needle is on the green indicator space on the bar
First to 10 wins
Click only when the needle is on the green bar to score points"


func s4():
	time.visible = false
	needle.visible = false
	quick.visible = true
	next.visible = false
	$Canvas/Header.text = "Quick Shot"
	$Canvas/Info.text = "Shoot when the text changes to draw and it takes a bit for the animation to finish
Shoot when the countdown reaches draw (Faster reaction wins)"
