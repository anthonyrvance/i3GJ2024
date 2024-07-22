extends Area2D

@export var reqSize = 3
@export var minScore = 1

func _on_body_entered(body):
	var player := body as Player
	if not player:
		return
		
	if player.get_size() >= reqSize:
		print("players size: " + str(player.get_size()) + "  which needs to be: " + str(reqSize) + " = SUCCESS")
		
	else:
		print("players size: " + str(player.get_size()) + " which needs to be: " + str(reqSize) + " = FAIL")
		get_tree().reload_current_scene()
