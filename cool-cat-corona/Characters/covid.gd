extends RigidBody2D

@export var speed : float = 150


var direction = Vector2(-1, 0)



func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()


func _physics_process(delta):
	var velocity = direction * speed * delta
	global_position += velocity





func _on_body_entered(body: CharacterBody2D):
	queue_free()
