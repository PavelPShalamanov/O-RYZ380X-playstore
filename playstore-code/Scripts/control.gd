extends Control

@onready var openPS = $OpenPlayStoreButton
@onready var welcomeText = $WelcomeText
@onready var exitPS = $ExitPlayStoreButton
@onready var Game_button = preload("res://scenes/game_button.tscn")
@onready var game_buttons = $VBoxContainer

var game_num = 1

var game_folder = "games"
var overviews_folder = "game-overviews"

func _ready() -> void:
	var output = []
	OS.execute("git", ["fetch"], output, true)
	print(output)
	OS.execute("git", ["checkout", "origin", "--", "playstore-code/game-overviews"])
	add_buttons()
	

func _on_open_play_store_button_button_down() -> void:
	openPS.hide()
	welcomeText.show()
	exitPS.show()
	game_buttons.show()

func _on_exit_play_store_button_button_down() -> void:
	openPS.show()
	welcomeText.hide()
	exitPS.hide()
	game_buttons.hide()
	
func add_buttons():
	var currentHbox : HBoxContainer
	var currentHBoxGames : int = 0
	for overview in DirAccess.get_directories_at(overviews_folder):
		var node = Game_button.instantiate()
		node.game_path = overviews_folder + "/" + overview
		
		if currentHBoxGames == 0:
			game_buttons.add_child(HBoxContainer.new())
		currentHbox = game_buttons.get_child(-1)
		currentHbox.add_child(node)
		currentHBoxGames += 1 if currentHBoxGames < 1 else -1
		
		#node.connect("game_selected", )
		
