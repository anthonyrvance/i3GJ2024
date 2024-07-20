extends Node

const PauseMenu = preload("res://Prefabs/UI/PauseMenu.tscn")
var pauseMenuInst

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		if pauseMenuInst == null:
			pauseMenuInst = PauseMenu.instantiate()
			get_tree().root.add_child(pauseMenuInst)
		else:
			pauseMenuInst.queue_free()
