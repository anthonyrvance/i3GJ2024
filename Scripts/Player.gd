extends CharacterBody2D

const tileSize = 16

@onready var rayUp = $RayCast2DUp
@onready var rayDown = $RayCast2DDown
@onready var rayLeft = $RayCast2DLeft
@onready var rayRight = $RayCast2DRight

var moving = false
var inputDir
var moveSpeed = 0.35

func _physics_process(delta):
	if moving == true:
		pass
	
	inputDir = Vector2.ZERO
	if Input.is_action_just_pressed("ui_down"):
		if !rayDown.is_colliding():
			inputDir = Vector2(0,1)
	elif Input.is_action_just_pressed("ui_up"):
		if !rayUp.is_colliding():
			inputDir = Vector2(0,-1)
	elif Input.is_action_just_pressed("ui_right"):
		if !rayRight.is_colliding():
			inputDir = Vector2(1,0)
	elif Input.is_action_just_pressed("ui_left"):
		if !rayLeft.is_colliding():
			inputDir = Vector2(-1,0)
		
	if inputDir != Vector2.ZERO:
		move()
		move_and_slide()
	
func move():
	if inputDir:
		if moving == false:
			moving = true
			var tween = create_tween()
			tween.tween_property(self, "position", position + inputDir * tileSize, moveSpeed)
			tween.tween_callback(move_false)
			
func move_false():
	moving = false
