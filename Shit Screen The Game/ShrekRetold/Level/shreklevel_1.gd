extends Node2D

#Note: in Debug, you can turn on visible Paths and Navigation to see the path finding.

var stopdouble = false
#Replace print() with actual victory stuff
func _on_exit_body_entered(body):
	if body.is_in_group("Player"):
		if not stopdouble:
			stopdouble = true
			$Win.visible = true
		


func _on_shrek_dead():
	losingtime()

func losingtime():
	if not stopdouble:
		stopdouble = true
		$Lose.visible = true

	
