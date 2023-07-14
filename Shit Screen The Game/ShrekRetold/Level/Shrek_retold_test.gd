extends CharacterBody2D

var can_move : = true
@export var move_speed : float = 2

func _physics_process(_delta):
	if can_move == true:
		var input_direction = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		)
		if input_direction.length() > 1:
			input_direction = input_direction.normalized()
		velocity = input_direction * move_speed
		move_and_slide()
		$AnimationPlayer.play("WalkingRight")
	if velocity == Vector2(0,0):
		$AnimationPlayer.play("RESET")
