extends Node2D

var minigames := {
	"cool_cat_corona": preload("res://cool cat corona/Levels/coolcat_level.tscn"),
	"cool_cat_crossing": preload("res://cool cat crossing/main.tscn"),
	"nielzap": preload("res://NielBreenZapsTerrorists/Leadin/Leadin.tscn"),
	"duloc": preload("res://ShrekRetold/Level/LeadinShrek/LeadinShrek.tscn") 
	}

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_corona_btn_pressed():
	# get_tree().change_scene_to_packed(minigames['cool_cat_corona'])
	SceneSwitcher.switch(SceneSwitcher.game_cool_cat_corona)
		
func _on_cool_cat_btn_pressed():
		# get_tree().change_scene_to_packed(minigames['cool_cat_crossing'])
		SceneSwitcher.switch(SceneSwitcher.game_cool_cat_crossing)
	
func _on_button_pressed():
	get_tree().change_scene_to_packed(minigames['nielzap'])


func _on_duloc_pressed():
	get_tree().change_scene_to_packed(minigames['duloc'])
