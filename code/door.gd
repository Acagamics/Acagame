extends Node3D

var open = false

func toggle():
	if open:
		$AnimationPlayer.play_backwards("open")
	else:
		$AnimationPlayer.play("open")
	open = not open
