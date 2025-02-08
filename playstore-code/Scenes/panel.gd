extends Panel

@onready var icon = $Game_icon
@onready var game_title = $Title
@onready var game_description = $Desc
@onready var game_version = $Version
@onready var game_publisher = $publisher
@onready var download_button = $Download
@onready var delete_button = $Delete
@onready var play_button = $Run
#var version_num = 0
@onready var executeable = ''
var game_dir_path = ''
var games_dir = "games"
var mnt_dir = "mnt"
var _is_on_usb = false


@onready var games_list = get_node("../VBoxContainer")


func _on_game_selected(game_path):
	game_dir_path = game_path
	var manifest_file = FileAccess.open(game_path + "/description.json", FileAccess.READ)
	var manifest_json = JSON.parse_string(manifest_file.get_as_text())
	
	icon.texture = ImageTexture.create_from_image(Image.load_from_file(game_path + "/icon.png"))
	game_title.text = manifest_json.title
	game_version.text = manifest_json.version
	game_publisher.text = manifest_json.publisher
	#version_num = manifest_json.version
	game_description.text = manifest_json.desc
	while game_description.get_line_count() > 3:
		game_description.text = game_description.text.substr(0, game_description.text.length()-4) + "..."
	
	games_list.hide()
	show()
	await get_tree().create_timer(0.2).timeout

func _on_back_pressed() -> void:
	hide()
	games_list.refresh()
	games_list.show()

func _on_download_pressed() -> void:
	print("Amogus")
	_on_back_pressed()
