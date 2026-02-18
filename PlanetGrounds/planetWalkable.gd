extends Node2D

@export var newModulate: Color
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#if(WorldManager.planetScheme!=null):
		#newModulate=WorldManager.planetScheme
	newModulate=desaturate(newModulate, .55)
	var mat = $Layer1.material  # or your node path
	if mat is ShaderMaterial:
		var from_list = mat.get_shader_parameter("to_colors")
		for i in range(from_list.size()):
			var c = from_list[i]
			from_list[i]=c*newModulate
		mat.set_shader_parameter("to_colors", from_list)

func desaturate(color: Color, amount: float) -> Color:
	# amount = 0 → no change, 1 → fully gray
	var gray = (color.r + color.g + color.b) / 3.0
	var new_r = lerp(color.r, gray, amount)
	var new_g = lerp(color.g, gray, amount)
	var new_b = lerp(color.b, gray, amount)
	return Color(new_r, new_g, new_b, color.a)
