extends CharacterBody2D
@export var move_speed := 25
@export var move_target: Marker2D
@export var nav_agent: NavigationAgent2D
var movement_target_position: Vector2 = move_target.global_position

func _ready():
	nav_agent.path_desired_distance = 4.0
	nav_agent.target_desired_distance = 4.0

	call_deferred("actor_setup")
	


func actor_setup():
	await get_tree().physics_frame
	set_movement_target(movement_target_position)

func set_movement_target(movement_target: Vector2):
	nav_agent.target_position = movement_target_position


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
		
		
		
		
