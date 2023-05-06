extends CharacterBody2D

#IMPORTANT LESSON ABOUT @EXPORT IT DOESN"T WORK IF YOUR CODE HAS A SINGLE ERROR
#IMPORTANT LESSON PATHFOLLOW2D DOESN"T USE OFFSET ANYMORE THEY RENAMED IT TO
# PROGRESS I SOLVED THEIR PUZZLE WITHOUT LOOKING UP THE SOLUTION

# IMPORTANT LESSEON ABOUT MOVING OBJECTS: you need the Path2D to be the parent.
# Why is this important? Well, when I first made the Glock, the object itself
# was the parent. I later put it as a child under a newly created 2D path.
# This worked, but it meant my Glock was split between two scenes.
# Also, when I used get.parent() in my code, and I had a "Glock with a Path2D"
# and an off screen "Glock without a Path2D" at the same time, it caused
# PROBLEMS until I deleted the offscreen Glock. 
# (Because they had DIFFERENT PARENTS but the SAME CODE)


# Make variables: Storring Covid in the Gun, the Marker2D I use to say where
# Covid should appear, the path2D, a bool that decides when movement happens
# @onready loads as soon as the node is created in scene. I still don't have
# a feel for what variables need to be made @onready, what variables need
# to be made {func _ready} and what variables can just be made in the code
# without ready.
@export var bullet : PackedScene


@onready var end_of_gun = $Glockmaster5000/Marker2D

@onready var path_follow = get_parent()


@onready var gunmove = true


@export var move_speed : float = 100



var t = 0.0



func _physics_process(delta):
	# I don't think the direction matters, so I just picked (0, 0) to start.
	# Pretty sure the movement 
	var _direction = Vector2.ZERO
	Vector2(0, 0)


	# I stop and start the gun movement with a bool in front of movement info.
	if gunmove == true:
		path_follow.set_progress(path_follow.get_progress() + move_speed * delta)



# To shoot, create Covid, add it to the root of the node tree, then
# have it appear at the node2D I made on the gun.
# NOTE: If I instead added it to the parent (which is the gun) it would instead
# travel forward RELATIVE TO THE GUN. So as the gun moves up and down, so would
# the forward moving COVID.
func shoot():
	var b = bullet.instantiate()
	get_tree().get_root().add_child(b)
	b.global_position = end_of_gun.global_position
# NOTE: The call to use shoot() is INSIDE THE ANIMATION PLAYER
# at a particular point during the shooting animation.


	"""
#For testing purposes I made it shoot when I pressed a button.
func _unhandled_input(event):
	if event.is_action_released("ShootTEST"):
		gunmove = false
		#play shooting animation
		shoot()
		gunmove = true
"""
# When the gun enters the hitbox for an invisible node, stop movement and
# play shooting animation.
func _on_area_2d_area_entered(area):
		gunmove = false
		$AnimationPlayer.play("Shooting")
		
		


# When gun finishes shooting animation, change to idle and allow it to move
# Until it hits the next place to shoot.
func _on_animation_player_animation_finished(Shooting):
	$AnimationPlayer.play("Idle")
	gunmove = true
	
	"""
	The commenting graveyard pit of failed attempts with reasoning behind it.
	
	{1} Every tutorial on movement showed two methods: One constantly updating the
	position, and another using "Tweening" which comes from inbetweeing, which
	is a method of smoothing transitions between two different frames 
	in annimation. Every source lists Tweening as suppirior for movement
	but while I could get it to work, I couldn't get it to loop movement.
	I need to look into it properly some time.
	
	The main gist seems to be modifying the value of a property between two values
	over a defined time.
	
	#DID NOT WORK func _ready():
#From Reddit "now tween works differently and I advise you not to use old habits or 
#you will have problems: "
	#set_process(true)
	#tween = get_node("Glockmaster5000").create_tween()
	#I think this is automatic with the new method add_child(tween)
	#tween.interpolate_value(0, 0.5, 0, 1, tween.TRANS_LINEAR, tween.EASE_IN_OUT)
	#tween.tween_property(path_follow, "progress_ratio", Vector2(0, 0.5), 1)
	
#func _ready():
	#var tween :Tween = create_tween().set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
	#tween.tween_property(ratio, "progress_ratio", 1, 1)

	
	{2} #I decided to have the gun shoot at set pathways rather than on a timer.
#@export var shoot_time : float = 4
#func _on_timer_timeout():
	#pick_new_state()
		#This didn't work var covid_spawn_location = $Glockmaster5000/Marker2D.position
		#var covid = covid_scene.instance()
		#add_child(covid)
		#covid.poisition = covid_spawn_location
	#shoot()
	
	{3} For animation tree I cut: I was trying to have a way to transition between
	Idle and Shooting animations, but it did not work out and actually 
	caused issues. I would like to learn how to properly learn how to make
	an annimation tree some day, esspecially since it might be useful for 
	calling code prompts.
	
	I think the main idea is creating two different states, then a function
	that lets you switch between states.
	
	# enum Gun_state {IDLE, SHOOTING}
	# func pick_new_state():
	#if(current_state == Gun_state.IDLE):
		#state_machine.travel("Shooting")
		#current_state = Gun_state.SHOOTING
	#elif(current_state == Gun_state.SHOOTING):
		#state_machine.travel("Idle")
		#current_state = Gun_state.IDLE
	
	#@onready var animation_tree = $AnimationTree
#@onready var state_machine = animation_tree.get("parameters/playback")
#ERROR @onready var timer : float = get_time_left
#var current_state : Gun_state = Gun_state.IDLE
	
{4} #Did not work PROBABLY BECAUSE OFFSET WAS CHANGED TO PROGRESS func MovementLoop(delta):
	#var prepos = path_follow.get_global_position()
	#path_follow.set_offset(path_follow.get_offset() + move_speed * delta)
	#var pos = path_follow.get_global_position()
	#move_direction = (pos.angle_to_point(prepos) / 3.14) * 100
	
	{5} Error probably due to trying to subtract an empty vector from an undefined vector
	#ERROR var move_direction : Vector2 - Vector2.ZERO
	
	{6} I think this was an error due to using a single values instead of a Vector2
	
	var move_direction = 0
	func _physics_process(delta):
	#ERROR velocity = move_direction * move_speed
	
	{7} Tried to make movement based on percentage of Path2D rather than absolute
	pixel values.
	
	#gunratio = path_follow.get_progress_ratio()
	#t += delta * 0.05
	#path_follow.set_progress_ratio(0 + (0.5-0) * t)
#
	#Error path_follow.set_progress_ratio(ratio)
	#
	{8} #THIS IS CONSTANT MOVEMENT I WANT STOP AND START 
	path_follow.set_progress(path_follow.get_progress() + move_speed * delta)
	#I can do better func _process(delta):
	#This is constant movement I can do better 
	
	"""
