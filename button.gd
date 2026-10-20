@tool
extends Button

@export var button_text: String:
	set(value):
		button_text = value
		
		if has_node("Label"):
			$Label.text = value
			$Label.visible = button_icon == null

@export var button_icon: Texture2D:
	set(value):
		button_icon = value
		
		if has_node("MarginContainer/Icon"):
			$MarginContainer/Icon.texture = value
			$MarginContainer/Icon.visible = value != null
		
		if has_node("Label"):
			$Label.visible = value == null

@export var normal_texture: Texture2D:
	set(value):
		normal_texture = value
		
		if has_node("Background"):
			$Background.texture = value

@export var pressed_texture: Texture2D

func _ready() -> void:
	$Label.text = button_text
	$Label.visible = button_icon == null
	
	$MarginContainer/Icon.texture = button_icon
	$MarginContainer/Icon.visible = button_icon != null

func _on_button_up() -> void:
	$Background.texture = normal_texture
	$Label.position.y -= 2
	$MarginContainer/Icon.position.y -= 2

func _on_button_down() -> void:
	$Background.texture = pressed_texture
	$Label.position.y += 2
	$MarginContainer/Icon.position.y += 2
