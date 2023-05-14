extends Control

@export var fullcountfull : float = 15
@onready var fullcount = fullcountfull
@onready var Text1 = $Text1
@onready var Text2 = $Text2
@onready var Text22 = $Text22
@onready var Text3 = $Text3
@onready var countdowntext = $countdowntext
@onready var pic = $Mouse

signal now

func _physics_process(_delta):
	if fullcount == (fullcountfull - 1):
		Text1.visible = true
	elif fullcount == (fullcountfull - 4 ):
		Text2.visible = true
	elif fullcount == (fullcountfull -2):
		pic.visible = true
	elif fullcount == (fullcountfull -5):
		Text22.visible = true
	elif fullcount == (fullcountfull - 7):
		Text3.visible = true
		now.emit()
		print("signaled")
		
func _on_timer_timeout():
	fullcount -= 1



