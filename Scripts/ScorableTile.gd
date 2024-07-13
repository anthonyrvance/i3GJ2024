extends Area2D

@export var score = 1
var refillable = true

func _on_body_entered(body):
	GlobalSignals.emit_signal("tileRolled", score)
