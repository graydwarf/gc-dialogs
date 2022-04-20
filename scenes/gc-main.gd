extends PanelContainer

func _process(__delta):
	if Input.is_action_pressed("ui_cancel"):
		gcSignals.emit_signal("gcCancelDialog")
