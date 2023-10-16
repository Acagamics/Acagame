extends HFlowContainer

@export var player : Player

func _process(delta: float) -> void:
	var player_hp = player.hp
	for child in get_children():
		var tex = child as TextureRect
		tex.visible = int(str(tex.name)) <= player_hp.hp
