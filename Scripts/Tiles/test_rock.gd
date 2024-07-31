extends Area2D

@export var exportFillingSprite = Texture2D

@onready var rock = $StaticBody2D
@onready var fillingSprite = $Sprite2D

func _ready():
	connect("body_exited", avalanche)
	fillingSprite.texture = exportFillingSprite

func avalanche(body):
	rock.set_collision_layer_value(1, true)
	print(rock.collision_layer)
	fillingSprite.visible = true


