extends Area2D

@export var minScore = 1

func _on_body_entered(body):
	var player := body as Player
	if not player:
		return
		
	if player.score < minScore:
		print("TODO: they should fall through hole so play fall anim, wait, then restart")
