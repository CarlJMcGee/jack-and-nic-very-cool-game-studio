extends Node2D

var _smoothed_mouse_pos: Vector2
@export var flash_speed := 5
@export var fade := false
var time := 0
var _visible = false

func _physics_process(delta: float):
	_smoothed_mouse_pos = lerp(_smoothed_mouse_pos, get_global_mouse_position(), 1)
	look_at(_smoothed_mouse_pos)
	
func zapnow():
	$Zap.visible = true
	await get_tree().create_timer(0.1).timeout
	$Zap.visible = false
		
func _input(event):
	if event.is_action_pressed("click(all mouse buttons)"):
		print("working")
		zapnow()
