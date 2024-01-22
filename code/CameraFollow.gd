extends Camera3D

@export var target: Node3D
@export var offset = Vector3(0, 5, 4)
@export var move_speed = 5

var velocity = Vector3.ZERO
var velocity2 = Vector3.ZERO
var look_target = Vector3.ZERO

func _process(delta: float) -> void:
	# Selfmade smooth camera follower
	# Fell free to modify and improve
		
	velocity = velocity.move_toward(
		(
			(target.global_position + offset)
		 	- global_position
		) - (velocity.normalized() * pow(velocity.length(), 0.8) * 10)
		, delta * 0.2
	)
	velocity *= 0.99
	global_position += velocity
	
	velocity2 = velocity2.move_toward(
		(target.global_position - look_target) - (velocity2.normalized() 
			* pow(velocity2.length(), .5) * 2)
		, delta * 0.5
	)
	velocity2 *= 0.95
	look_target += velocity2
	look_at(look_target)
