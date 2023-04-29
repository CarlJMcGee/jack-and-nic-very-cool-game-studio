extends Node2D

@export var car_scene: PackedScene
@export var speed_limit = 150

# Called when the node enters the scene tree for the first time.
func _ready():
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func clearScreen():
	$HUD.get_node("WinLabel").hide()
	$HUD.get_node("LoseLabel").hide()
	$HUD.get_node("RestartBtn").hide()
	$Player.hide()

func game_over():
	$CarTimer.stop()
	$HUD.get_node("LoseLabel").show()
	$Butch.get_node("AnimatedSprite2D").play("laugh")
	$HUD.get_node("RestartBtn").show()

func you_win():
	$CarTimer.stop()
	for car in get_tree().get_nodes_in_group("cars"):
		if is_instance_valid(car):
			car.queue_free()
	$HUD.get_node("WinLabel").show()
	$HUD.get_node("RestartBtn").show()
	
func new_game():
	clearScreen()
	$Butch.get_node("AnimatedSprite2D").play("default")
	$Player.start($StartPos.position)
	$CarTimer.start()
	
	if is_instance_valid($Car3):
		$Car3.get_node("AnimatedSprite2D").flip_h = true

	if is_instance_valid($Car4):
		$Car4.get_node("AnimatedSprite2D").flip_h = true

func _on_car_timer_timeout():
	var car = car_scene.instantiate()
	car.add_to_group("cars")
	var lanes = ["Eastbound1", "Eastbound2", "Westbound1", "Westbound2"]
	var spawn_lane = get_node(lanes[randi_range(0, lanes.size() - 1)])
	car.position = spawn_lane.position

	if (spawn_lane.name.contains("East")):
		car.linear_velocity = Vector2(speed_limit, 0.0)
		car.get_node("AnimatedSprite2D").flip_h = false
		
	elif (spawn_lane.name.contains("West")):
		car.linear_velocity = Vector2(speed_limit * -1, 0.0)
		car.get_node("AnimatedSprite2D").flip_h = true



	add_child(car)

func _on_reset():
	get_tree().reload_current_scene()