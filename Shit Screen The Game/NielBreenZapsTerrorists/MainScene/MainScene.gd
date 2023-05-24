extends Node2D

@onready var Tcounter := 4
var restart := preload("res://main_menu.tscn")
var fail := preload("res://NielBreenZapsTerrorists/Leadin/Leadin.tscn")

var stopclick := false

signal stopzapping
"""
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
				print("A click!")
				"""

func _physics_process(delta):
	if Tcounter == 0:
		stopzapping.emit()
		youwin()
		stopclick = true
		Tcounter = -2

func _on_rigid_body_2d_youlose():
	if stopclick == false:
		stopzapping.emit()
		stopclick = true
		$Dead.visible = true
		$AudioStreamPlayer.playing = false
		$Catsong.play()
		await get_tree().create_timer(4.0).timeout
		get_tree().change_scene_to_packed(fail)




func _on_terror_1_winning_bl():
	Tcounter -= 1
	var test : String = str(Tcounter)


func _on_terror_2_winning_br():
	Tcounter -= 1
	var test : String = str(Tcounter)



func _on_terror_3_winning_um():
	Tcounter -= 1
	var test : String = str(Tcounter)



func _on_terror_4_winning_ur():
	Tcounter -= 1
	var test : String = str(Tcounter)


func youwin():
	if stopclick == false:
		stopzapping.emit()
		$Winpic.visible = true
		$AudioStreamPlayer.stop()
		$Winsound.play()
		stopclick = true
	


func _on_winsound_finished():
	# get_tree().change_scene_to_packed(restart)
	MadHatter.assign_seat(MadHatter.main_menu)


func _on_bombtime_kaboom():
	if stopclick == false:
		stopclick = true
		$AudioStreamPlayer.stop()
		$Bombsound.play()
		$"Twisted-pair".visible = true


func _on_bombsound_finished():
	get_tree().change_scene_to_packed(fail)
