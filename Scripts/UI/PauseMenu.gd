extends Control

func _on_quit_confirm_button_pressed():
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")


func _on_close_pause_menu_button_pressed():
	queue_free()


func _on_settings_button_pressed():
	pass # Replace with function body.


func _on_open_quit_menu_button_pressed():
	$Exit.visible = true
	$Pause.visible = false


func _on_close_escape_menu_button_pressed():
	$Exit.visible = false
	$Pause.visible = true
