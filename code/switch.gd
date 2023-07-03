extends Area3D

signal activate

func _ready() -> void:
	body_entered.connect(on_body_entered)
	
func on_body_entered(body: Node3D):
	activate.emit()
