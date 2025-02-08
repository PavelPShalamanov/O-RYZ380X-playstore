extends Control

@onready var openPS = $OpenPlayStoreButton
@onready var welcomeText = $WelcomeText
@onready var exitPS = $ExitPlayStoreButton

func _ready() -> void:
	pass
	

func _on_open_play_store_button_button_down() -> void:
	#openPS.disabled = true
	#openPS.visible = false
	print("Entered")
	openPS.hide()
	
	#welcomeText.visible = true
	welcomeText.show()
	
	#exitPS.disabled = false
	#exitPS.visible = true
	exitPS.show()


func _on_exit_play_store_button_button_down() -> void:
	#openPS.disabled = false
	#openPS.visible = true
	print("exited")
	openPS.show()
	
	#welcomeText.visible = false
	welcomeText.hide()
	#exitPS.disabled = true
	#exitPS.visible = false
	exitPS.hide()
func add_buttons():
	pass
