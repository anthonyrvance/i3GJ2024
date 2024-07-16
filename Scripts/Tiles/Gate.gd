extends Area2D

@export var reqScore = 3

func _on_body_entered(body):
	var player := body as Player
	if not player:
		return
		
	if player.score >= reqScore:
		print("score: " + str(player.score) + " needs to be above " + str(reqScore) + " = SUCCESS")
	else:
		print("score: " + str(player.score) + " needs to be above " + str(reqScore) + " = FAIL")
