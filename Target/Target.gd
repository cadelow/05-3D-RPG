extends StaticBody

func die():
	Global.update_score(20)
	queue_free()
