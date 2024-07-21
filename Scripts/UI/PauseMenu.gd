extends Control

func _on_resume_play_button_pressed():
	queue_free()

func _on_open_settings_button_pressed():
	print("make settings pls")

func _on_open_exit_menu_button_pressed():
	$Exit.visible = true
	$Pause.visible = false

func _on_quit_level_button_pressed():
		get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")

func _on_return_button_pressed():
	$Exit.visible = false
	$Pause.visible = true
