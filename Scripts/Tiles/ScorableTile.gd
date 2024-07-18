extends Area2D

@export var score = 1
@export var refillable = false
@export var turnsToRefill = 3
@export var exportFillingSprite = Texture2D

@onready var fillingSprite = $Sprite2D

var usedOnce = false
var refilling = false
var currTurnsToRefill = 0

func _ready():
	GlobalSignals.connect("playerMoved", _turn_passed)
	fillingSprite.texture = exportFillingSprite

func _on_body_entered(body):
	if refilling == true:
		return
		
	if usedOnce == true and refillable == false:
		return
		
	GlobalSignals.emit_signal("tileRolled", score)
	usedOnce = true
	fillingSprite.visible = true
	
	if refillable == false:
		return
	
	refilling = true
	currTurnsToRefill = turnsToRefill
	
func _turn_passed():
	if refilling == true:
		currTurnsToRefill -= 1
		if currTurnsToRefill < 1:
			_refill_tile()
		
func _refill_tile():
	refilling = false;
	fillingSprite.visible = false
