extends Node2D

#Note: in Debug, you can turn on visible Paths and Navigation to see the path finding.

@onready var tryagain := preload("res://ShrekRetold/Level/LeadinShrek/LeadinShrek.tscn")
@onready var next := preload("res://main_menu.tscn")

var stopdouble := false
#Replace print() with actual victory stuff
func _on_exit_body_entered(body):
	if body.is_in_group("Player"):
		if not stopdouble:
			$Bombtime.queue_free()
			stopdouble = true
			$Win.visible = true
			$Duloc.stop()
			$DulocWin.play()
		


func _on_shrek_dead():
	losingtime()

func losingtime():
	if not stopdouble:
		stopdouble = true
		$Lose.visible = true
		$Duloc.stop()
		$DulocLose.play()


func _on_duloc_finished():
	losingtime()


func _on_duloc_win_finished():
	get_tree().change_scene_to_packed(next)


func _on_duloc_lose_finished():
	get_tree().change_scene_to_packed(tryagain)
