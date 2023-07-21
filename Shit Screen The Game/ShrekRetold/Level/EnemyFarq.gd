extends CharacterBody2D
@export var move_speed := 25

var move_target : Node2D = null
@export var nav_agent: NavigationAgent2D



#test
var testing: Vector2 = Vector2(60.0, 180.0)

func _ready():
	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 4.0
	


	#var target_point: Vector2 = move_target.global.position
	call_deferred("actor_setup")
	


func actor_setup():
	await get_tree().physics_frame
	set_movement_target(testing)

func set_movement_target(movement_target: Vector2):
	nav_agent.target_position = movement_target


func _physics_process(_delta):
	if nav_agent.is_navigation_finished():
		return
	
	var current_agent_position: Vector2 = global_position
	var next_path_position: Vector2 = nav_agent.get_next_path_position()
	
	var new_velocity: Vector2 = next_path_position - current_agent_position
	
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * move_speed
	velocity = new_velocity
	
	move_and_slide()
		
		
		
		

func makepath():
	nav_agent.target_position = testing

func _on_shrek_target(target):
	testing = target
	makepath()
