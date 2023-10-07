extends CharacterBody2D

var can_move : = true
@export var move_speed : float = 2
signal target
@onready var shrek = $Marker2D
var location : Vector2 = Vector2(0, 0)

signal dead
var dead_emitted := false

func informfarq():
	location = shrek.global_position
	emit_signal("target", location)

func _ready():
	informfarq()

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
		""" Only works if parent is a pure Node2D
		if abs(input_direction.x) >= 0.001:
			scale.x *= sign(input_direction.x)
		"""
		if input_direction.x > 0.001:
			$ShrekRetoldWalkTestrightonly.flip_h = 1
		elif input_direction.x < 0:
			$ShrekRetoldWalkTestrightonly.flip_h = 0
	if velocity == Vector2(0,0):
		$AnimationPlayer.play("RESET")


func _on_timer_timeout():
	informfarq()


func _on_area_2d_body_entered(body):
	#print(body.get_groups()) THIS WAS USEFUL FOR TESTING!
	if body.is_in_group("Badguy"):
			dead_emitted = true
			emit_signal("dead")
			queue_free()
