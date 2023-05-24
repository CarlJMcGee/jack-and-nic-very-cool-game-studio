extends CanvasLayer

var current_scene: Node
@export var main_menu := "res://main_menu.tscn"
@export var cool_cat_corona := "res://cool cat corona/Levels/coolcat_level.tscn"
@export var cool_cat_crossing := "res://cool cat crossing/main.tscn"
@export var nielzap := "res://NielBreenZapsTerrorists/Leadin/Leadin.tscn"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func switch(lvl_path: String):
	call_deferred("_def_switch", lvl_path)

func _def_switch(lvl_path: String):
	get_tree().root.get_child(get_child_count() -1).queue_free()
	var new_scene := load(lvl_path)
	current_scene = new_scene.instantiate()
	get_tree().root.add_child(current_scene)
	get_tree().current_scene = current_scene

func change_scene_packed(scene: PackedScene):
	await call_deferred("_def_change_scene_packed", scene)

func _def_change_scene_packed(scene: PackedScene):
	get_tree().current_scene.queue_free()
	get_tree().change_scene_to_packed(scene)
