extends Node2D


#Stops the music when Cool Cat overlaps with maks, which sends a "signal" which 
#allows other scripts to do things in response
func _on_mask_music_stop():
	$AudioStreamPlayer2D.stop()

"""
The commenting graveyard pit of failed attempts with reasoning behind it.

# Thought I needed to load Covid into main scene to use it. I ended up loading
it into the Glockmaster 5000.

@export var covid_scene: PackedScene

#Crashed my computer
#Tried to make covid appear ever few seconds, and spawn it at a marker on
the Glock5000. 
	func _on_timer_timeout():
		var covid_spawn_location = $Glockmaster5000/Marker2D.position
		var covid = covid_scene.instance()
		add_child(covid)
		covid.poisition = covid_spawn_location


"""
