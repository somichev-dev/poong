extends Button

var titleCount = 0

func _on_pressed() -> void:
	titleCount += 1
	text = "po" + "o".repeat(titleCount) + "ong"
	position.x = (get_window().size.x - size.x) / 2
