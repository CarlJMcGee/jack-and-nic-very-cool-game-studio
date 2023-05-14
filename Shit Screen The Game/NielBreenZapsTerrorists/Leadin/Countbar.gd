extends TextureProgressBar
@onready var barsize := 3

var starttime : bool = false




func _physics_process(_delta):
	pass

func _on_timer_timeout():
	if starttime == true:
		if value > 0.9:
			value -= 1


func _on_control_now():
	starttime = true
