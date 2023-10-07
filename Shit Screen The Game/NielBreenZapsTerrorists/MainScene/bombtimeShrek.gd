extends TextureProgressBar
#Hope this didn't affect Zap

func _on_timer_2_timeout():
		if value > 0:
			value -= 1
