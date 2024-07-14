extends Node2D

#@onready var playBtn = $Sprite2D/Button



func _on_button_pressed():
	get_tree().change_scene_to_file("res://Levels/Sandbox.tscn")
