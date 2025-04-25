extends Control

@onready var animation_player: AnimationPlayer = $ColorRect/AnimationPlayer

func _ready():
	var music_player = GlobalAudio.get_node("AudioStreamPlayer")
	if not music_player.playing:
		music_player.play()
	
	# Play the fade-in animation once when ready
	animation_player.play("fade_in")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scripts_Mainmenu/settings.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_play_pressed():
	# When play is pressed, play a fade-out animation before moving scenes
	get_tree().change_scene_to_file("res://CS1.tscn")
	animation_player.play("fade_out")

func _on_fullscreen_pressed():
	# Safely toggle fullscreen only if not running in editor and not in embedded window
	if OS.has_feature("standalone") and not Engine.is_editor_hint():
		var current_mode := DisplayServer.window_get_mode()
		if current_mode == DisplayServer.WINDOW_MODE_FULLSCREEN:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		else:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		print("Fullscreen not supported in embedded or editor mode.")

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	# Only act when the fade_out is finished
	if anim_name == "fade_out":
		get_tree().change_scene_to_file("res://Scenes/control.tscn")
