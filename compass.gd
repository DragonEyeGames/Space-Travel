extends Sprite2D

@export var player: Node2D

func _process(delta: float) -> void:
	rotation=-player.rotation
	for child in get_children():
		child.rotation=-rotation
