extends CharacterBody2D

var winSize : Vector2
const START_SPEED : int = 500
const ACCEL : int = 50
var speed : int
var dir : Vector2
const MAX_ANGLE : float = 60
const MAX_ANGLE_DIST : float = 40

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
			dir = new_direction(collider)
		else:
			dir = dir.bounce(collision.get_normal())

func new_direction(collider):
	var dist_normalized = (position.y - collider.get_position().y) / MAX_ANGLE_DIST
	var new_dir := Vector2()
	# determine angle
	var angle = deg_to_rad(MAX_ANGLE * dist_normalized)
	# determine vector
	new_dir.x = dir.x * -1
	new_dir.y = sin(angle)
	return new_dir

