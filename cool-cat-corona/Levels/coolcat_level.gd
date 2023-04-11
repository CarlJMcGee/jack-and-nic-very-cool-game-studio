extends Node2D
#@export var covid_scene: PackedScene

#Crashed my computer func _on_timer_timeout():
	#var covid_spawn_location = $Glockmaster5000/Marker2D.position
	#var covid = covid_scene.instance()
	#add_child(covid)
	#covid.poisition = covid_spawn_location


func _on_mask_music_stop():
	$AudioStreamPlayer2D.stop()
