extends StaticBody2D

var winHeight : int
var paddleHeight : int

# Called when the node enters the scene tree for the first time.
func _ready():
	winHeight = int(get_viewport_rect().size.y)
	paddleHeight = $ColorRect.get_size().y
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta
		 
	position.y = clamp(position.y, paddleHeight / 2.0, winHeight - paddleHeight / 2.0)
