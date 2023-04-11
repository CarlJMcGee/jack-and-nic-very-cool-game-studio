extends CharacterBody2D
@export var move_speed : float = 2
var screen_size = Vector2.ZERO

var can_move = true

var sprite_x
var sprite_y

@export var Gameover : PackedScene

func kill():
	$Dead.start()
	can_move = false
	var fail = Gameover.instantiate()
	get_parent().add_child(fail)

func _ready():
	screen_size = get_viewport_rect().size
	#Error var covid_node = get_tree().get_root().find_node("covid",true,false)
	#Error covid_node.connect("touching",self,"hit_by_covid")
	#var CoolC = get_node("CoolCatMain")
	sprite_x = $CoolcatMainSprite.texture.get_width() / 2.0
	sprite_y = $CoolcatMainSprite.texture.get_height() / 2.0

func _physics_process(_delta):
	# Get input direction
	if can_move == true:
		var input_direction = Vector2(
			Input.get_action_strength("right") - Input.get_action_strength("left"),
			Input.get_action_strength("down") - Input.get_action_strength("up")
		)
		if input_direction.length() > 1:
			input_direction = input_direction.normalized()
		print(input_direction)
	#Update velocity
		velocity = input_direction *move_speed
	#This was used when I had Area2D instead of Psychic object
	#
	#position += input_direction * move_speed * _delta
	#position.x = clamp(position.x, 0, screen_size.x)
	#position.y = clamp(position.y, 0, screen_size.y)
	#
	
	#Move and Slide function (uses velocity of character body to move character on map) 
		move_and_slide()
	#If collide slide against wall instead of full collision
	#move_and_collide() Needs paramiters
		position.x = clamp(position.x, 0, screen_size.x)
		position.y = clamp(position.y, 0, screen_size.y)
	#Keep Cool Cat From leaving screen
		
	



func _on_dead_timeout():
	get_tree().reload_current_scene()










func _on_area_2d_body_entered(body: RigidBody2D)->void:
	#if body.is_in_group("GoodV"):
		#print("We Did it")
		#queue_free()
	#else:
		#kill()
	kill()


func _on_face_area_entered(area):
	queue_free()
