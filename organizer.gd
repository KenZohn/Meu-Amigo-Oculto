extends Control

func _ready() -> void:
	add_participant()

func _on_button_pressed() -> void:
	add_participant()

func add_participant() -> void:
	var participant = preload("res://participant.tscn").instantiate()
	
	participant.deleted.connect(_on_participant_deleted)
	
	$CenterContainer/Panel/ParticipantsArea/ScrollContainer/VBoxContainer.add_child(participant)
	
	await get_tree().process_frame
	
	participant.focus_name()
	$CenterContainer/Panel/ParticipantsArea/ScrollContainer.ensure_control_visible(participant)
	
	update_participants_number()

func update_participants_number() -> void:
	var participants = $CenterContainer/Panel/ParticipantsArea/ScrollContainer/VBoxContainer.get_children()
	
	for i in participants.size():
		participants[i].set_number(i + 1)
	
	$CenterContainer/Panel/ParticipantsNumber/Value.text = str(participants.size())

func _on_participant_deleted() -> void:
	await get_tree().process_frame
	update_participants_number()
