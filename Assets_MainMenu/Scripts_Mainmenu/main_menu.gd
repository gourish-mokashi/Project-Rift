extends Control
@onready var animation_player: AnimationPlayer = $ColorRect/AnimationPlayer


func _ready():
	var music_player = GlobalAudio.get_node("AudioStreamPlayer")
	if not music_player.playing:
		music_player.play()



func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scripts_Mainmenu/settings.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_play_pressed():
	pass
	

	
func _process(delta):
	animation_player.play("fade_in")


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	queue_free()
