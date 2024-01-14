extends Button

# Reference to the "Sussy" node
var mySprite : Node2D = null
var audio_stream: AudioStream

# Texture to change to when the button is pressed
var newTexture : Texture = preload("res://Assets/Dead Sus.png")

func _ready():
	# Find the "Sussy" node by name
	mySprite = get_node("/root/Main Menu/MarginContainer/Sussy")
	audio_stream = preload("res://Sounds/died.ogg")

func _on_pressed():
	if mySprite != null:
		# Change the texture of the "Sussy" node
		mySprite.texture = newTexture
		play_sound()

func play_sound():
	if audio_stream:
		# Create an AudioStreamPlayer2D node if it doesn't exist.
		var audio_player = $"../../../DeathSound"
		if not audio_player:
			audio_player = AudioStreamPlayer2D.new()
			add_child(audio_player)
		
		# Set the audio stream to play.
		audio_player.stream = audio_stream
		
		# Play the audio.
		audio_player.play()
