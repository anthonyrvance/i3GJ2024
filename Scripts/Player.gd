extends CharacterBody2D
class_name Player

const tileSize = 16

@onready var rayUp = $RayCast2DUp
@onready var rayDown = $RayCast2DDown
@onready var rayLeft = $RayCast2DLeft
@onready var rayRight = $RayCast2DRight
@onready var snowSound1 = preload("res://Sound/snow-step-1-81064.mp3")
@onready var snowSound2 = preload("res://Sound/snow-step-2-102324.mp3")
@onready var snowSound3 = preload("res://Sound/snow-step-3-81065.mp3")

@export var growThreshold = 3 #theoretically this could be higher for wet snow or something
@export var minScore = 0
@export var maxScore = 45
@export var ballSprites = []

var moving = false
var score = 3
var inputDir
var moveSpeed = 0.35
var startingRotation = 0

func get_size():
	return floor(score / growThreshold)

func _ready():
	GlobalSignals.connect("tileRolled", tile_rolled)

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
			GlobalSignals.emit_signal("playerMoved")
			
			roll_anim()
			
			# sound effect at the beginning
			_play_rand_step_fx()
			
			moving = true
			var tween = create_tween()
			tween.set_ease(Tween.EASE_IN_OUT)
			tween.tween_property(self, "position", position + inputDir * tileSize, moveSpeed)
			tween.tween_callback(move_end)
			
func move_end():
	moving = false
	
	# check threshold
	#print("modded = " + str(floor(score / growThreshold)))
	$Node2D/Sprite2D.texture = ballSprites[get_size() - 1]

	# sound effect at the end
	#_play_rand_step_fx()

func tile_rolled(inScore):
	score += inScore
	score = clampi(score, minScore, maxScore) # NOTE if we plan to be able to go negative then come back here
	GlobalSignals.emit_signal("playersNewSize", get_size())
	print("new score is " + str(score))

# maybe make this its own property thats tracked like moving?	
func roll_anim():
	return # NOTE try again later I guess
	var tween = create_tween()
	startingRotation += 90
	tween.tween_property($Node2D/Sprite2D, "rotation", startingRotation, moveSpeed)

func _play_rand_step_fx():
	var r = randi_range(1,3)
	if r == 1:
		BackgroundMusicPlayer.play_fx(snowSound1)
	elif r == 2:
		BackgroundMusicPlayer.play_fx(snowSound2)
	elif r == 3:
		BackgroundMusicPlayer.play_fx(snowSound3)
