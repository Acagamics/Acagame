extends CharacterBody3D

@export var max_speed = 5
@export var acceleration = 60

func _physics_process(delta: float) -> void:
	var move = get_move()
	var planar = Vector3(move.x, 0, -move.y)
	var move_target = planar * max_speed
	var move_delta = delta * acceleration
	
	velocity = velocity.move_toward(move_target, move_delta / 2)
	move_and_slide()
	velocity = velocity.move_toward(move_target, move_delta / 2)


func get_move() -> Vector2:
	var x = Input.get_axis("move_left", "move_right")
	var y = Input.get_axis("move_down", "move_up")
	return Vector2(x,y).normalized() 

func extend(value: Vector2, with: float) -> Vector3:
	return Vector3(value.x, value.y, with)


func _on_hp_death() -> void:
	global_position = Vector3.ZERO
	# todo better death
