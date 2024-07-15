extends Node2D

func _ready():
	BackgroundMusicPlayer.play_music_level()

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Sandbox.tscn")
