extends RigidBody2D
# Makes a variable that can be edited in the editor to change move speed of 
#Covid. Used in veloctiy

# NOTE: Remember to set gravity to 0 for any Ridgid2D objects you don't want
# falling.
@export var speed : float = 150

# Have Covid always move to the left.
var direction = Vector2(-1, 0)


# IMPORTANT CODING BEST PRACTICE
# When Covid leaves the screen, destroy it. Also, it sounds like there are
# multiple ways to destroy something and queue_free() is considered one of the
# good ways to do so. 
# Game works find without this, but I assume infinate covid offscreen is bad
# for processing.
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

# Constantly move Covid.
func _physics_process(delta):
	var velocity = direction * speed * delta
	global_position += velocity




# When collide with Cool Cat, destroy.
# This prevents an infinate death if Cool Cat doesn't move and the Covid
# doesn't disapear when the scene resets.
func _on_body_entered(body: CharacterBody2D):
	queue_free()
