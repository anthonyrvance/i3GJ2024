extends Area2D

@export var reqSize = 3
@export var levelPathToLoad = ""

func _ready():
	GlobalSignals.emit_signal("gateGoalSize", reqSize)

func _on_body_entered(body):
	var player := body as Player
	if not player:
		return
		
	if player.get_size() == reqSize:
		print("players size: " + str(player.get_size()) + "  which needs to be: " + str(reqSize) + " = SUCCESS")
		get_tree().change_scene_to_file(levelPathToLoad)
	else:
		print("players size: " + str(player.get_size()) + " which needs to be: " + str(reqSize) + " = FAIL")
