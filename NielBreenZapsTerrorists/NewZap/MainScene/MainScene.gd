extends Node2D

@onready var Tcounter := 4

"""
func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		if get_rect().has_point(to_local(event.position)):
				print("A click!")
				"""


func _on_rigid_body_2d_youlose():
	pass




func _on_terror_1_winning_bl():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)


func _on_terror_2_winning_br():
	Tcounter -= 1
	var test : String = str(Tcounter)
	print(test)
