extends AudioStreamPlayer2D

const menu_music = preload("res://Sound/main_theme_draft1_loop.wav")
const level_music = preload("res://Sound/snow-132947.mp3")
const button_jingle = preload("res://Sound/Jingle Bells Single Hit Lower.mp3")

var effectsVolume = 0

func _play_music(music: AudioStream, volume = 0.0):
	if stream == music:
		return
		
	stream = music
	volume_db = volume_db
	bus = "Music"
	play()
	
func play_music_level():
	_play_music(level_music)

func play_music_menu():
	_play_music(menu_music)

func play_fx(stream: AudioStream, volume = 0.0):
	var fx_player = AudioStreamPlayer.new()
	fx_player.stream = stream
	fx_player.name = "FX_PLAYER"
	fx_player.volume_db = effectsVolume
	fx_player.pitch_scale = randf_range(.8, 1.0)
	fx_player.bus = "Effects"
	
	add_child(fx_player)
	fx_player.play()
	
	await fx_player.finished
	
	fx_player.queue_free()
