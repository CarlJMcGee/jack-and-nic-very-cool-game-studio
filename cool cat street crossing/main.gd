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
	$Player.hide()
	$Car.hide()
	$Car2.hide()
	$Car3.hide()
	$Car4.hide()

func game_over():
	$CarTimer.stop()
	$HUD.get_node("LoseLabel").show()
	$Butch.get_node("AnimatedSprite2D").play("laugh")

func you_win():
	$CarTimer.stop()
	$HUD.get_node("WinLabel").show()
	
func new_game():
	clearScreen()
	$Butch.get_node("AnimatedSprite2D").play("default")
	$Player.start($StartPos.position)
	$CarTimer.start()
	$Car.show()
	$Car2.show()
	$Car3.show()
	$Car3.get_node("AnimatedSprite2D").flip_h = true
	$Car4.show()
	$Car4.get_node("AnimatedSprite2D").flip_h = true
	# $StartTimer.start()

func _on_start_timer_timeout():
	$Player.start($StartPos.position)
	$CarTimer.start()
	$Car.show()
	$Car2.show()
	$Car3.show()
	$Car3.get_node("AnimatedSprite2D").flip_h = true
	$Car4.show()
	$Car4.get_node("AnimatedSprite2D").flip_h = true

func _on_car_timer_timeout():
	var car = car_scene.instantiate()
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




