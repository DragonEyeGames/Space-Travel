extends Sprite2D

@export var player: Node2D
@export var target: Node2D
@export var radius: float = 500

func _process(_delta: float) -> void:
	rotation=player.rotation
	if target == null:
		visible = false
		return

	var dir = target.global_position - player.global_position
	var distance = dir.length()

	# Clamp to circle radius
	if distance > radius:
		dir = dir.normalized() * radius

	global_position = player.global_position + dir

	$RichTextLabel.text = str(int(distance))
	visible = distance > 700
