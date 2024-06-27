extends Button

@export_file("*.tscn") var singleplayer_scene

func _on_pressed() -> void:
	get_tree().change_scene_to_file(singleplayer_scene)
