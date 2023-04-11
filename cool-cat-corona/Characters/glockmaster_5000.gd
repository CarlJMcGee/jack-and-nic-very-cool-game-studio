extends CharacterBody2D

#IMPORTANT LESSON ABOUT @EXPORT IT DOESN"T WORK IF YOUR CODE HAS A SINGLE ERROR
#IMPORTANT LESSON PATHFOLLOW2D DOESN"T USE OFFSET ANYMORE THEY RENAMED IT TO PROGRESS I SOLVED THEIR PUZZLE WITHOUT LOOKING UP THE SOLUTION

@export var bullet : PackedScene
# for animation tree I cut enum Gun_state {IDLE, SHOOTING}

@onready var end_of_gun = $Glockmaster5000/Marker2D

@onready var path_follow = get_parent()



#@onready var ratio = get_parent()

@onready var gunmove = true
#@onready var gunratio = 0

@export var shoot_time : float = 4

var move_direction = 0

@export var move_speed : float = 100
#@onready var animation_tree = $AnimationTree
#@onready var state_machine = animation_tree.get("parameters/playback")
#ERROR @onready var timer : float = get_time_left
#var current_state : Gun_state = Gun_state.IDLE

#ERROR @export var covid_scene: PackedScene
var t = 0.0

#ERROR var move_direction : Vector2 - Vector2.ZERO

#Did not work func MovementLoop(delta):
	#var prepos = path_follow.get_global_position()
	#path_follow.set_offset(path_follow.get_offset() + move_speed * delta)
	#var pos = path_follow.get_global_position()
	#move_direction = (pos.angle_to_point(prepos) / 3.14) * 100

#I can do better func _process(delta):
	#This is constant movement I can do better 
	
#DID NOT WORK func _ready():
#From Reddit "now tween works differently and I advise you not to use old habits or you will have problems: "
	#set_process(true)
	#tween = get_node("Glockmaster5000").create_tween()
	#I think this is automatic with the new method add_child(tween)
	#tween.interpolate_value(0, 0.5, 0, 1, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	#tween.tween_property(path_follow, "progress_ratio", Vector2(0, 0.5), 1)
	
#func _ready():
	#var tween :Tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	#tween.tween_property(ratio, "progress_ratio", 1, 1)



func _physics_process(delta):
	#ERROR velocity = move_direction * move_speed
	var _direction = Vector2.ZERO
	Vector2(0, 0)


	#t += delta * 0.05
	#path_follow.set_progress_ratio(0 + (0.5-0) * t)
#
	#Error path_follow.set_progress_ratio(ratio)
	#
	#THIS IS CONSTANT MOVEMENT I WANT STOP AND START path_follow.set_progress(path_follow.get_progress() + move_speed * delta)
	
	if gunmove == true:
		path_follow.set_progress(path_follow.get_progress() + move_speed * delta)
	
	#gunratio = path_follow.get_progress_ratio()
	
	
	
	
#For animation tree I cut func pick_new_state():
	#if(current_state == Gun_state.IDLE):
		#state_machine.travel("Shooting")
		#current_state = Gun_state.SHOOTING
	#elif(current_state == Gun_state.SHOOTING):
		#state_machine.travel("Idle")
		#current_state = Gun_state.IDLE


func shoot():
	var b = bullet.instantiate()
	get_tree().get_root().add_child(b)
	b.global_position = end_of_gun.global_position

#I decided to have the gun shoot at set pathways rather than on a timer.
#func _on_timer_timeout():
	#pick_new_state()
		#This didn't work var covid_spawn_location = $Glockmaster5000/Marker2D.position
		#var covid = covid_scene.instance()
		#add_child(covid)
		#covid.poisition = covid_spawn_location
	#shoot()
	
#For testing purposes replace with timer trigger
func _unhandled_input(event):
	if event.is_action_released("ShootTEST"):
		gunmove = false
		#play shooting animation
		shoot()
		gunmove = true

func _on_area_2d_area_entered(area):
		gunmove = false
		$AnimationPlayer.play("Shooting")
		#When animation is over
		



func _on_animation_player_animation_finished(Shooting):
	$AnimationPlayer.play("Idle")
	gunmove = true
