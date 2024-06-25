extends Node2D

var score := [0, 0]
const PADDLE_SPEED : int = 500

func better_sign(i):
	if(i < 0):
		return -1
	else:
		return 1

func _on_ball_timer_timeout():
	$Ball.new_ball()

func _on_scoring_left_body_entered(_body):
	score[1] += 1
	$"Hud/Player2Score".text = str(score[1])
	$"BallTimer".start()

func _on_scoring_right_body_entered(_body):
	score[0] += 1
	$"Hud/Player1Score".text = str(score[0])
	$"BallTimer".start()
