extends Sprite2D

func _on_timer_timeout():
	$Node2DGroup.visible = true
	$TimerDelay.start()

func _on_timer_delay_timeout():
	queue_free()
