extends Area2D

@export var score = 1
@export var refillable = false
@export var turnsToRefill = 3
@onready var fillingSprite = $Sprite2D

var refilling = false
var currTurnsToRefill = 0

func _ready():
	GlobalSignals.connect("playerMoved", _turn_passed)

func _on_body_entered(body):
	if refilling == true:
		return
		
	GlobalSignals.emit_signal("tileRolled", score)
	refilling = true
	currTurnsToRefill = turnsToRefill
	fillingSprite.visible = true
	
func _turn_passed():
	if refilling == true:
		currTurnsToRefill -= 1
		if currTurnsToRefill < 1:
			_refill_tile()
		
func _refill_tile():
	refilling = false;
	fillingSprite.visible = false
