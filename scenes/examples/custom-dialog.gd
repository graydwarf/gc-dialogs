extends Node2D

func _ready():
	InitSignals()

func InitSignals():
	gcSignals.connect("gcCancelDialog", self, "gcCancelDialog")

func gcCancelDialog():
	CloseDialog()
	
func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	$MouseBlockerScreen.visible = true
	$Dialog.visible = true
	$Dialog.show_modal(true)

func CloseDialog():
	$MouseBlockerScreen.visible = false
	$Dialog.visible = false

func _on_YesButton_pressed() -> void:
	SetResponse("Yes, of course the user likes it.")
	CloseDialog()

func _on_NoButton_pressed() -> void:
	SetResponse("No!?!, welp.. you could always use an image.")
	CloseDialog()

func _on_OpenDialogButton_pressed() -> void:
	SetResponse("")
	gcSignals.emit_signal("gcShowMouseBlockerScreen")
	ShowDialog()

func _on_CancelButton_pressed():
	CloseDialog()
