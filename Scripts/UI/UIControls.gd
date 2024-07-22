extends Node2D

const PauseMenu = preload("res://Prefabs/UI/PauseMenu.tscn")
const ExitMenu = preload("res://Prefabs/UI/ExitMenu.tscn")
const SettingsMenu = preload("res://Prefabs/UI/SettingsMenu.tscn")


func _on_pause_button_pressed():
	get_tree().root.add_child(PauseMenu.instantiate())


func _on_exit_button_pressed():
	get_tree().root.add_child(ExitMenu.instantiate())


func _on_restart_button_pressed():
	get_tree().reload_current_scene()


func _on_settings_button_pressed():
	get_tree().root.add_child(SettingsMenu.instantiate())
