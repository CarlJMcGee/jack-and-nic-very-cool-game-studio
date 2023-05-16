extends RichTextLabel

var number : int = 3
var shout := str("Go!")
var final := true


func _on_control_now():
	visible = true

func _physics_process(_delta):
	if number == 2:
		set_text("2")
	elif number == 1:
		set_text("1")
	elif number <= 0:
		set_text(shout)

func _on_timer_timeout():
	number -= 1
