extends Button

func SetText(t):
	self.text = t

func _on_ExampleNode_pressed() -> void:
	gcSignals.emit_signal("gcLoadExample", self.text)
