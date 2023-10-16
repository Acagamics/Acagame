extends CharacterBody3D
class_name Player

@export var max_speed = 5
@export var acceleration = 60
@export var hp : Hp

func _physics_process(delta: float) -> void:
	var move = get_move()
	var move_target = move * max_speed
	var move_delta = delta * acceleration
	
	var planar_velocity = Vector2(velocity.x, velocity.z)
	planar_velocity = planar_velocity.move_toward(move_target, move_delta)
	velocity.x = planar_velocity.x
	velocity.z = planar_velocity.y
	velocity.y -= delta * 50
	
	
	move_and_slide()


func get_move() -> Vector2:
	var x = Input.get_axis("move_left", "move_right")
	x += Input.get_joy_axis(0, JOY_AXIS_LEFT_X)
	var y = Input.get_axis("move_up", "move_down")
	y += Input.get_joy_axis(0, JOY_AXIS_LEFT_Y)
	var dir = Vector2(x,y) 
	if dir.length() > 1:
		return dir.normalized()
	else:
		return dir

func extend(value: Vector2, with: float) -> Vector3:
	return Vector3(value.x, value.y, with)


func _on_hp_death() -> void:
	global_position = Vector3.UP * 2
	# todo better death
