extends Sprite2D

@export var player: Node2D
@export var target: Node2D

func _process(_delta: float) -> void:
	if(target==null):
		visible=false
		return
	global_position=target.global_position
	if(global_position.x<player.global_position.x-500):
		global_position.x=player.global_position.x-500
	if(global_position.x>player.global_position.x+500):
		global_position.x=player.global_position.x+500
	if(global_position.y<player.global_position.y-270):
		global_position.y=player.global_position.y-270
	if(global_position.y>player.global_position.y+270):
		global_position.y=player.global_position.y+270
	$RichTextLabel.text=str(int(round(player.global_position.distance_to(target.global_position))))
	visible=!(int(round(player.global_position.distance_to(target.global_position)))<700)
