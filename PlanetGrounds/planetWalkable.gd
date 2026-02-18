extends Node2D

@export var newModulate: Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var mat = $Layer1.material  # or your node path
	if mat is ShaderMaterial:
		var from_list = mat.get_shader_parameter("to_colors")
		for i in range(from_list.size()):
			var c = from_list[i]
			from_list[i]=c*newModulate
		mat.set_shader_parameter("to_colors", from_list)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
