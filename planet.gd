extends Node2D
@export var planetType = ""
@export var noiseParts: Array[Texture2D] = []
@export var toxicPart1: Array[Color] = []
@export var toxicPart2: Array[Color] = []
@export var radioactivePart1: Array[Color] = []
@export var radioactivePart2: Array[Color] = []

func _ready() -> void:
	$Land.texture=noiseParts.pick_random()
	$Clouds.texture=noiseParts.pick_random()
	$Land.rotation=randf_range(-180, 180)
	$Clouds.rotation=randf_range(-180, 180)
	await get_tree().process_frame
	scale.x=randf_range(.7, 1.3)
	scale.y=scale.x
	if(planetType=="toxic"):
		$Base.modulate=toxicPart1.pick_random()
		$Land.modulate=toxicPart2.pick_random()
	if(planetType=="radioactive"):
		$Base.modulate=radioactivePart1.pick_random()
		$Land.modulate=radioactivePart2.pick_random()
