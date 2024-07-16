extends Area2D

@export var score = 1

func _on_body_entered(body):
	GlobalSignals.emit_signal("tileRolled", score)
