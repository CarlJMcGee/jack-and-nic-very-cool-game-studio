extends Timer


func _physics_process(_delta):
	print(time_left)

func _on_control_starttime():
	start()

