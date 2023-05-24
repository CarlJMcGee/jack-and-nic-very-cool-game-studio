extends CanvasLayer

signal reset


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func show_btns():
	$RestartBtn.show()
	$MenuBtn.show()

func hide_btns():
	$RestartBtn.hide()
	$MenuBtn.hide()

func _on_restart_btn_pressed():
	reset.emit()


func _on_menu_btn_pressed():
	SceneSwitcher.switch(SceneSwitcher.main_menu)