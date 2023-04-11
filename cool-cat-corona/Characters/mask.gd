extends Area2D
@export var Victory : PackedScene

signal Music_stop



func _on_area_entered(area):
	Music_stop.emit()
	$VictorySong.play()
	var win = Victory.instantiate()
	get_parent().add_child(win)
	


func _on_victory_song_finished():
	get_tree().quit()
