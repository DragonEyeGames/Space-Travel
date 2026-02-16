extends Node2D
@export var planetType = ""
@export var noiseParts: Array[Texture2D] = []
@export var toxicPart1: Array[Color] = []
@export var toxicPart2: Array[Color] = []
@export var radioactivePart1: Array[Color] = []
@export var radioactivePart2: Array[Color] = []
@export var hotPart1: Array[Color] = []
@export var hotPart2: Array[Color] = []
@export var coldPart1: Array[Color] = []
@export var coldPart2: Array[Color] = []
@export var barrenPart1: Array[Color] = []
@export var barrenPart2: Array[Color] = []

func _ready() -> void:
	$Land.texture=noiseParts.pick_random()
	$Clouds.texture=noiseParts.pick_random()
	$Land.rotation=randf_range(-180, 180)
	$Clouds.rotation=randf_range(-180, 180)
	await get_tree().process_frame
	scale.x=randf_range(.7, 1.3)
	scale.y=scale.x
	print(planetType)
	if(planetType=="toxic"):
		$Base.modulate=toxicPart1.pick_random()
		$Land.modulate=toxicPart2.pick_random()
	if(planetType=="radioactive"):
		$Base.modulate=radioactivePart1.pick_random()
		$Land.modulate=radioactivePart2.pick_random()
	if(planetType=="hot"):
		$Base.modulate=hotPart1.pick_random()
		$Land.modulate=hotPart2.pick_random()
	if(planetType=="icy"):
		$Base.modulate=coldPart1.pick_random()
		$Land.modulate=coldPart2.pick_random()
	if(planetType=="barren"):
		$Base.modulate=barrenPart1.pick_random()
		$Land.modulate=barrenPart2.pick_random()
	if(planetType=="high"):
		scale=Vector2 (2, 2)
		$Base.modulate=Color(randf(), randf(), randf())
		$Land.modulate=Color(randf(), randf(), randf())
	if(planetType=="low"):
		scale = Vector2(.5, .5)
		$Base.modulate=Color(randf(), randf(), randf())
		$Land.modulate=Color(randf(), randf(), randf())
