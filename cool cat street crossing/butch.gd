extends Area2D

signal hit


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body:Node2D):
	print('hit')
	$AnimatedSprite2D.stop()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)


func _on_area_entered(area:Area2D):
	print('hit')
	$AnimatedSprite2D.stop()
	hit.emit()
	$CollisionShape2D.set_deferred("disabled", true)
