extends Node
class_name Hp

@export var max_hp = 3
@onready var hp = max_hp

signal death

func damage(amount: float):
	hp -= amount
	if hp <= 0:
		death.emit()
		hp = max_hp
