extends Control

func _on_resume_play_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	queue_free()
