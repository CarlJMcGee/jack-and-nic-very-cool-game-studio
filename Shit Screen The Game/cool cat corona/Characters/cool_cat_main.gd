extends CharacterBody2D

#NOTE: Remember to set gravity to 0 for any CharacterBody2D objects you don't want
# falling.

# Makes a variable that can be edited in the editor to change move speed of 
#Cool Cat. Used in veloctiy
@export var move_speed : float = 2

# Making lots of variables. Vector2.ZERO makes an empty (0,0) vector, which is common 
# for 2D stuff. 3D stuff uses more Vector3. 
var screen_size = Vector2.ZERO

var can_move = true

var sprite_x
var sprite_y

# Export var : PackedScene makes an empty box in editor you can drag a scene to.
#This lets you store a scene you want to make later.
@export var Gameover : PackedScene

# When running kill(), start a delay timer, stop Cool Cat's Movement, create
# the stored "Gameover" scene (I think it creates it centered at (0,0) by default
# and I just made it so off centered that it forms in the middle of the scene.)
# NOTE: I still don't know the difference between instance() and instantiate().
# instance() didn't work for for me.
# Also, nothing will appear when you instantiate() until you add it to a node.
# This adds the GameOver scene directly to the Coolcat CharacterBody2D
func kill():
	$Dead.start()
	can_move = false
	var fail = Gameover.instantiate()
	get_parent().add_child(fail)

# Find the size of the screen and of the cool cat sprite.
func _ready():
	get_window().size = Vector2i(1460, 910)
	screen_size = get_viewport_rect().size
	sprite_x = $CoolcatMainSprite.texture.get_width() / 2.0
	sprite_y = $CoolcatMainSprite.texture.get_height() / 2.0

# Process() (Also called Idle Processing)
# calls as often as the CPU speed allows (frame rate), 
# while physics_process calls at a fixed rate. (Default = 60 per sec)
# delta is the time elapsed in seconds since the previous call. 
# which can let you normalize things like movement regardless of frame rate.
# While you need delta in (), the editor gets grumpy if you don't reference delta.
# If you need process but not delta, the editor kindly requests you instead
# use _delta, to let it know you think you know what you are doing.
func _physics_process(_delta):
	# Get input direction. Can be turned off by changing can_move to false as
	# A quick way to end movement.
	# Note: there are multiple ways you can get input direction. The way this one
	# Works is first, the possible inputs and keys that equal those inputs are set
	# up in {Project Settings -> Input Map} I used both arrow keys and wasd.
	# Then make a vector. x = right minus left. So if both are pressed, no move.
	# Same for y, but for up and down.
	# NOTE: DOWN IS DEFINED AS positive 1, NOT NEGATIVE
	# I think this is because Godot defines origin as top left corner.
	# I don't know if it does anything (Maybe if both left and A are pressed)
	# But out of coding good practice, I also normalized the direction in 
	# case the value is ever greater than 1 or negative 1.
	if can_move == true:
		var input_direction = Vector2(
			Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
			Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
		)
		if input_direction.length() > 1:
			input_direction = input_direction.normalized()
		# Print was used for debugging in console. It is not needed for final reslease.
	#Important Lesson: Using print to test if something is working, especially
	# When there are multiple moving parts that could cause something.
	# Also nice because it doesn't crash the game like some other errors.
		#print(input_direction)
	#Update velocity. Note: I probably should have added "* delta" but it works
	# So I'm not touching it for now.
		velocity = input_direction * move_speed
	
	
	#Move and Slide function (uses velocity of character body to move character on map)
	# If it collides, slides along rather than fully stopping movement.
	#You might be able to replace velocity with a Vector2 inside () 
		move_and_slide()
	#If collide slide against wall instead of full collision
	#move_and_collide() Needs more paramiters than move_and_slide.
	
	#Keep Cool Cat From leaving screen
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
	
		
	


# When the delay timer for a game over is done, restart the scene
# NOTE: I noticed in testing somethimes NOT EVERYTHING RESETS PERFECTLY!
# SOMETIMES a COVID STAYED ON SCREEN DURING THE RESET.
# I fixed the problem by destroying the colliding Coivid, but just beware in 
# future.
func _on_dead_timeout():
	get_tree().reload_current_scene()









# When CoolCat collides with a RigidBody2D object, run kill.
# I don't know what {->void} does, and I've only seen it in a few examples,
# But I think it is a good coding practice for some reason. I will try to find
# The reason but it oesn't seem essential.
func _on_area_2d_body_entered(body: RigidBody2D)->void:
	kill()

# When the hitbox on Cool Cat's face interacts with maks hitbox, detroy cool cat.
# The victory script is on the mask itself.
# ALSO, see {3} below for more detailed explination.
func _on_face_area_entered(area):
	queue_free()
	
	
	"""
	The commenting graveyard pit of failed attempts with reasoning behind it.

# {1} Intention: prepare for when Cool Cat overlaps with Covid. This is pretty 
old so that's all I remember I promise the other graveyard things will be better.
I think the struggle was how to reference things in the cool cat script that were
outside cool cat himself.	
	func _ready():
	var covid_node = get_tree().get_root().find_node("covid",true,false)
	covid_node.connect("touching",self,"hit_by_covid")
	CoolC = get_node("CoolCatMain")

	# {2} This was used when I had Area2D instead of Psychic object
	This is good movement for objects that can't use
	move_and_slide() or move_and_collide()
	I ended up basing the main clamp on this.
	#
	position += input_direction * move_speed * _delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)
	#
	
# {3} I tried to make it so that when Cool Cat collided with the mask, the mask being
in group "GoodV" would cause victory (and destroy Cool Cat), and if Cool Cat
Collided with the Covid, do kill(). I instead put the collision layer CoolCat
main body interacts with on a different layer (1 and 2) than the hitbox for
Cool Cat's face hitbox, and made the mask on the same layer.
This simplified things because I could call "When collide with anything"
And mask plus face are the only possible things that could collide on layer 3
rather than be speciific.

	func _on_area_2d_body_entered(body: RigidBody2D)->void:
	if body.is_in_group("GoodV"):
		print("We Did it")
		queue_free()
	else:
		#kill()
	
	"""
