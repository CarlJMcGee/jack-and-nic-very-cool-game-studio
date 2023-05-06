extends RigidBody2D

var id = randi()

# Called when the node enters the scene tree for the first time.
func _ready():
	var car_model = $AnimatedSprite2D.sprite_frames.get_animation_names()
	$AnimatedSprite2D.play(car_model[randi_range(0, car_model.size() - 1)])


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_visible_on_screen_notifier_2d_screen_exited():
	remove_from_group("cars")
	queue_free()
