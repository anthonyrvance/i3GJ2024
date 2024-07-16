extends Control

@onready var musicSlider = $HSlider

func _ready():
	musicSlider.value = BackgroundMusicPlayer.volume_db

func _on_h_slider_value_changed(value):
	BackgroundMusicPlayer.volume_db = value
