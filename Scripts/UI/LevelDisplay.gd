extends Sprite2D

func _ready():
	$Label.text = get_tree().current_scene.name
	
