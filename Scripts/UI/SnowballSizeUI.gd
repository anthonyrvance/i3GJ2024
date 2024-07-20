extends Control

func _ready():
	GlobalSignals.connect("playersNewSize", new_player_size)
	GlobalSignals.connect("gateGoalSize", new_gate_size)
	
func new_player_size(size):
	_turn_off_children($"Snowballs and Number Arrows")
	match size:
		1:
			$"Snowballs and Number Arrows/Group 1".visible = true
		2:
			$"Snowballs and Number Arrows/Group 2".visible = true
		3:
			$"Snowballs and Number Arrows/Group 3".visible = true
		4:
			$"Snowballs and Number Arrows/Group 4".visible = true
		5:
			$"Snowballs and Number Arrows/Group 5".visible = true
		6:
			$"Snowballs and Number Arrows/Group 6".visible = true
		7:
			$"Snowballs and Number Arrows/Group 7".visible = true
		8:
			$"Snowballs and Number Arrows/Group 8".visible = true
		9:
			$"Snowballs and Number Arrows/Group 9".visible = true
		10:
			$"Snowballs and Number Arrows/Group 10".visible = true
		11:
			$"Snowballs and Number Arrows/Group 11".visible = true
		12:
			$"Snowballs and Number Arrows/Group 12".visible = true

func new_gate_size(size):
	match size:
		1:
			$"Empty Snowballs and Goal/Group 1".visible = true
		2:
			$"Empty Snowballs and Goal/Group 2".visible = true
		3:
			$"Empty Snowballs and Goal/Group 3".visible = true
		4:
			$"Empty Snowballs and Goal/Group 4".visible = true
		5:
			$"Empty Snowballs and Goal/Group 5".visible = true
		6:
			$"Empty Snowballs and Goal/Group 6".visible = true
		7:
			$"Empty Snowballs and Goal/Group 7".visible = true
		8:
			$"Empty Snowballs and Goal/Group 8".visible = true
		9:
			$"Empty Snowballs and Goal/Group 9".visible = true
		10:
			$"Empty Snowballs and Goal/Group 10".visible = true
		11:
			$"Empty Snowballs and Goal/Group 11".visible = true
		12:
			$"Empty Snowballs and Goal/Group 12".visible = true

func _turn_off_children(inNode):
	for c in inNode.get_children():
		c.visible = false
