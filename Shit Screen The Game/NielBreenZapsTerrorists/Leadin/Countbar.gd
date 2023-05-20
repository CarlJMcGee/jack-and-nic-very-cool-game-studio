extends TextureProgressBar

signal kaboom
var stop := false
func _on_timer_timeout():
	if value > 0:
		value -= 1



func _physics_process(delta):
	if value == 0:
		if stop == false:
			kaboom.emit()
			
			

func _on_kaboom():
	stop = true
