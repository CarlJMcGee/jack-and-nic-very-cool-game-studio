extends Node2D

@export var car_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func game_over():
	$CarTimer.stop()

func new_game():
	$Player.hide()
	$StartTimer.start()

func _on_start_timer_timeout():
	$Player.start($StartPos.position)
	$CarTimer.start()

func _on_car_timer_timeout():
	print("start car")
	var car = car_scene.instantiate()
	var car_spawn_location = get_node("PathLeft/PathFollowLeft")
	car_spawn_location.progress_ratio = randf()
	car.position = car_spawn_location.position

	# var vel = Vector2(randi_range(150, 250), 0.0)
	car.linear_velocity = Vector2(100, 0.0)

	add_child(car)
