extends Node2D

@export var planet: Node2D
@export var targetMarker: Node2D


func _on_button_pressed() -> void:
	targetMarker.target=planet
