extends Node2D  # or Node3D if 3D

@export var scene_to_spawn: PackedScene
@export var spawn_count: int = 10
@export var radius: float = 10000
@export var min_distance: float = 1500
#High and low reference the gravity of the planet
var planetTypes = ["toxic", "radioactive", "hot", "icy", "barren", "high", "low"]
var planetsInSystem = ["habitable"]
func _ready():
	for i in range(0, 5):
		planetsInSystem.append(planetTypes.pick_random())
	spawn_in_circle()


func spawn_in_circle():
	var positions = []

	var attempts = 0
	while positions.size() < spawn_count and attempts < spawn_count * 10:
		attempts += 1

		# Random angle
		var angle = randf() * TAU

		# Random distance from center (0.0 to radius)
		var r = randf() * radius

		var pos = Vector2(cos(angle), sin(angle)) * r

		# Check distance from all previously spawned points
		var valid = true
		for p in positions:
			if pos.distance_to(p) < min_distance:
				valid = false
				break

		if valid:
			positions.append(pos)
			print(pos)
			var instance = scene_to_spawn.instantiate()
			add_child(instance)
			instance.global_position = pos
			instance.planetType=planetsInSystem[0]
			planetsInSystem.remove_at(0)
			var newMini=$"HUD/Minimap/Minimap Planet".duplicate()
			$HUD/Minimap.add_child(newMini)
			newMini.position=pos/100
			#newMini.position=Vector2.ZERO
			newMini.visible=true
