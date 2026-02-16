extends CanvasLayer


func _on_button_pressed() -> void:
	$Mission.visible=false
	$Open.visible=true


func open() -> void:
	$Mission.visible=true
	$Open.visible=false
