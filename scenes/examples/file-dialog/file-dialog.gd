extends Container

signal CancelDialog

func _ready():
	InitSignals()

func InitSignals():
	connect("CancelDialog", self, "CloseDialog")
	
# Note: The MODE_SAVE_FILE dialog is for selecting where you want
# to eventually save a file. It does not save the actual file at
# the time of selection. It only returns the path so you could
# later run some code to save a file to that destination.
# The dialog will warn you about overwriting existing files
# although again, it doesn't overwrite anything until you
# explicitly execute code to do so. The code to save a file is
# not included in this demo. See File in help for how to do that.
func ShowDialog(mode : int):
	$FileDialog.mode = mode
	$FileDialog.call_deferred("popup")

	# Note: Files won't show in the dialog unless you set these
	# after .show() or click the refresh button in the dialog.
	$FileDialog.current_path = "res://assets/"
	$FileDialog.current_dir = "res://assets/"

	UpdateResponseTextForGivenMode(mode)

func CloseDialog():
	$FileDialog.visible = false

# MODE_OPEN_FILE = 0 - The dialog allows selecting one, and only one file.
# MODE_OPEN_FILES = 1 - The dialog allows selecting multiple files.
# MODE_OPEN_DIR = 2 - The dialog only allows selecting a directory, disallowing the selection of any file.
# MODE_OPEN_ANY = 3 - The dialog allows selecting one file or directory.
# MODE_SAVE_FILE = 4 - The dialog will warn when a file exists.
func UpdateResponseTextForGivenMode(mode):
	if mode == 0:
		SetResponseText("Waiting for user to select a file...")
	if mode == 1:
		SetResponseText("Waiting for user to select one or more files...")
	elif mode == 2:
		SetResponseText("Waiting for user to select a directory...")
	elif mode == 3:
		SetResponseText("Waiting for user to select anything...")
	elif mode == 4:
		SetResponseText("Waiting for user to save a file...")

func SetResponseText(message):
	$ResponseLabel.text = message

func _on_FileDialog_file_selected(path: String) -> void:
	SetResponseText("File Selected - " + path)
	CloseDialog()

func _on_FileDialog_dir_selected(dir: String) -> void:
	SetResponseText("Directory Selected - " + dir)
	CloseDialog()

func _on_FileDialog_files_selected(paths: PoolStringArray) -> void:
	SetResponseText("Files Selected - " + str(paths))
	CloseDialog()

func _on_OpenFileDialogButton_pressed() -> void:
	ShowDialog(0)

func _on_OpenFilesDialogButton_pressed() -> void:
	ShowDialog(1)

func _on_OpenDirDialogButton_pressed() -> void:
	ShowDialog(2)

func _on_OpenAnyDialogButton_pressed() -> void:
	ShowDialog(3)

func _on_OpenSaveFileDialogButton_pressed() -> void:
	ShowDialog(4)

func _on_FileDialog_popup_hide():
	CloseDialog()

func _input(inputEvent):
	if inputEvent is InputEventKey and not inputEvent.echo:
		if Input.is_key_pressed(KEY_ESCAPE):
			CloseDialog()
