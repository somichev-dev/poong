extends CharacterBody2D

var winSize : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2
const MAX_ANGLE_DIF = 60

func _ready():
	winSize = get_viewport_rect().size
	
func new_ball():
	position.x = winSize.x / 2
	position.y = winSize.y / 2 + randi_range(-200,200)
	speed = START_SPEED
	dir = random_direction()

func random_direction():
	var newDir := Vector2()
	newDir.x = [1, -1].pick_random()
	newDir.y = randf_range(-1, 1)
	return newDir.normalized()

func _physics_process(delta):
	var collision = move_and_collide(dir * speed * delta)
	var collider
	if collision:
		collider = collision.get_collider()	
		if collider in [%Player1, %Player2]:
			speed += ACCEL
			dir = dir.bounce(collision.get_normal())
		else:
			dir = dir.bounce(collision.get_normal())

func new_direction(collider):
	print(position.y)
	print(collider.get_position().y)
	var dist = (position.y - collider.get_position().y)/5
	var new_dir := Vector2()
	# determine angle
	var angle = PI / 4 * dist - PI / 8
	# determine vector
	new_dir.x = cos(angle) * sign(dir.x) * -1
	new_dir.y = sin(angle) * sign(dist)
	return new_dir

