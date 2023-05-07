extends Control

@export var fullcountfull : float = 15
@onready var fullcount = fullcountfull
func _physics_process(_delta):
	if fullcount == (fullcountfull - 1):
		

func _on_timer_timeout():
	fullcount -= 1
