extends Area2D

signal hit

@export var speed = 400
var screenSize

# Called when the node enters the scene tree for the first time.
func _ready():
	screenSize = get_viewport_rect().size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vel = Vector2.ZERO

	if Input.is_action_pressed("move_up"):
		vel.y -= 1
	if Input.is_action_pressed("move_down"):
		vel.y += 1
	if Input.is_action_pressed("move_right"):
		vel.x += 1
	if Input.is_action_pressed("move_left"):
		vel.x -= 1

	if vel.length() > 0:
		vel = vel.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()
		
	position += vel * delta
	position.x = clamp(position.x, 0, screenSize.x)
	position.y = clamp(position.y, 0, screenSize.y)

func _on_body_entered(body):
	$CrashFX.play()
	hide()
	hit.emit()

	$CollisionShape2D.set_deferred("disabled", true)

func start(pos):
	position = pos
	show()

	$CollisionShape2D.disabled = false
