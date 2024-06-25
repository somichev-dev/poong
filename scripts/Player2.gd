extends StaticBody2D

var ballPos : Vector2
var dist : float
var moveBy : int
var winHeight : int
var paddleHeight : int

# Called when the node enters the scene tree for the first time.
func _ready():
	winHeight = int(get_viewport_rect().size.y)
	paddleHeight = $ColorRect.get_size().y

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	ballPos = $"../Ball".position
	dist = position.y - ballPos.y
	moveBy = get_parent().PADDLE_SPEED * $"../".better_sign(dist)
	position.y -= moveBy * delta
	
	position.y = clamp(position.y, paddleHeight / 2.0, winHeight - paddleHeight / 2.0)
