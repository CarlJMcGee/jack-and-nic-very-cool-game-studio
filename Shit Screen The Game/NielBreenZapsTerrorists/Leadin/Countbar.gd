extends TextureProgressBar

signal kaboom
var stop := false
var finalbar := false
func _on_timer_timeout():
	if value > 0:
		if finalbar == true:
			value -= 1



func _physics_process(delta):
	if value == 0:
		if stop == false:
			kaboom.emit()
			
			

func _on_kaboom():
	stop = true


func _on_control_now():
	finalbar = true
	visible = true
