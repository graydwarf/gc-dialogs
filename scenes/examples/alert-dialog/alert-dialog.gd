extends Node2D

func SetResponse(response):
	$ResponseLabel.text = response

func ShowDialog():
	visible = true

func CloseDialog():
	HideDialog()

func HideDialog():
	visible = false

func _on_OpenDialogButton_pressed():
	OS.alert("Displays a modal dialog box using the host OS' facilities. Execution is blocked until the dialog is closed. It also blocks interactions with the rest of the app automatically. Useful for debugging but generally too ugly for players and users.", "Fancy Title Goes Here")
	SetResponse("Done waiting for alert dialog!")
	
# godot-companion support functions below here
func Reset():
	CloseDialog()
	SetResponse("")

