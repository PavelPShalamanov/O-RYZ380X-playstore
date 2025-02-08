extends Control

@onready var openPS = $OpenPlayStoreButton
@onready var welcomeText = $WelcomeText
@onready var exitPS = $ExitPlayStoreButton

func _ready() -> void:
	pass
	

func _on_open_play_store_button_button_down() -> void:
	openPS.disabled = true
	openPS.visible = false
	
	welcomeText.visible = true
	
	exitPS.disabled = false
	exitPS.visible = true


func _on_exit_play_store_button_button_down() -> void:
	openPS.disabled = false
	openPS.visible = true
	
	welcomeText.visible = false
	
	exitPS.disabled = true
	exitPS.visible = false
	
func add_buttons():
	pass
