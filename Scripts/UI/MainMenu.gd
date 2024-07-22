extends Node2D

const SettingsMenu = preload("res://Prefabs/UI/SettingsMenu.tscn")

func _ready():
	BackgroundMusicPlayer.play_music_level()

func _on_start_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	get_tree().change_scene_to_file("res://Levels/Level 1.tscn")

func _on_settings_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	get_tree().root.add_child(SettingsMenu.instantiate())

func _on_quit_button_pressed():
	BackgroundMusicPlayer.play_fx(BackgroundMusicPlayer.button_jingle)
	get_tree().quit()
