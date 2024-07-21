extends Node2D

func _ready():
	BackgroundMusicPlayer.play_music_level()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Level 1.tscn")

func _on_settings_button_pressed():
	print("make settings pls")

func _on_quit_button_pressed():
	get_tree().quit()
