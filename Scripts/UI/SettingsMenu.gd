extends Control

@onready var effectsSlider = $ExitBackground/EffectsSlider
@onready var musicSlider = $ExitBackground/MusicSlider

func _ready():
	musicSlider.value = db_to_linear(BackgroundMusicPlayer.volume_db)
	effectsSlider.value = db_to_linear(BackgroundMusicPlayer.effectsVolume)


func _on_music_slider_value_changed(value):
	BackgroundMusicPlayer.volume_db = linear_to_db(value)


func _on_effects_slider_value_changed(value):
	BackgroundMusicPlayer.effectsVolume = linear_to_db(value)


func _on_resume_button_pressed():
	queue_free()
