extends Area3D

@export var hp: Hp

func _ready() -> void:
	area_entered.connect(on_area_entered)

func on_area_entered(area: Area3D):
	if area is Hurtbox:
		hp.damage(area.damage_amount)
