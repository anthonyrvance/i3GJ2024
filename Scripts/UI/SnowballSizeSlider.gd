extends Control

@onready var slider = $HSlider

# Called when the node enters the scene tree for the first time.
func _ready():
	GlobalSignals.connect("playersNewSize", new_size)
	
func new_size(size):
	slider.value = size
