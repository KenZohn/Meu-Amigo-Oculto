extends Control

signal deleted

func _on_button_pressed() -> void:
	deleted.emit()
	queue_free()

func set_number(number: int) -> void:
	$Number.text = str(number) + "."

func focus_name() -> void:
	$Name.grab_focus()
