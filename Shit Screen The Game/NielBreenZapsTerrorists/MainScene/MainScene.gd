extends Node2D

@onready var Tcounter := 4
var restart := preload("res://main_menu.tscn")
var fail := preload("res://NielBreenZapsTerrorists/Leadin/Leadin.tscn")

var test := 4
"""
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
				print("A click!")
				"""

func _physics_process(delta):
	if Tcounter == 0:
		youwin()


func _on_rigid_body_2d_youlose():
	$Dead.visible = true
	$AudioStreamPlayer.playing = false
	$Catsong.play()
	await get_tree().create_timer(4.0).timeout
	get_tree().change_scene_to_packed(fail)




func _on_terror_1_winning_bl():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)


func _on_terror_2_winning_br():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)


func _on_terror_3_winning_um():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)


func _on_terror_4_winning_ur():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)

func youwin():
	$Winpic.visible = true
	$AudioStreamPlayer.playing = false
	await get_tree().create_timer(2.0).timeout
	get_tree().change_scene_to_packed(restart)
