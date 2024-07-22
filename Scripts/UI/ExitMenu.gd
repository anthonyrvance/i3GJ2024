extends Control

func _on_resume_button_pressed():
	queue_free()

func _on_quit_button_pressed():
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")
