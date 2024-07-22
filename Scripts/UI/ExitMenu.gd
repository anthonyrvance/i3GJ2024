extends Control

func _on_resume_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	queue_free()

func _on_quit_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	get_tree().change_scene_to_file("res://Levels/MainMenu.tscn")
