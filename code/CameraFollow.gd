extends Camera3D

@export var target: Node3D
@export var offset = Vector3(0, 5, 4)
@export var move_speed = 5

func _process(delta: float) -> void:
	var target_position = target.global_position + offset
	var distance = target_position.distance_to(global_position)
	var move_delta = delta * move_speed * distance
	
	global_position = global_position.move_toward(target_position, move_delta)
	look_at(target.global_position)
