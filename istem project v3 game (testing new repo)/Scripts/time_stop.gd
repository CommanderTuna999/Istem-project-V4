extends Node

@export var time_stop_active = false
var time_stop_cooldown = false

func _ready() -> void:
	if Input.is_action_just_pressed("Ability"):
		if $AbilityFolder/Timestop.ability == "timestop":
			if not time_stop_active and not time_stop_cooldown:
				activate_time_stop()

func activate_time_stop() -> void:
	time_stop_active = true
	await get_tree().create_timer(6.0).timeout
	time_stop_active = false
	time_stop_cooldown = true
	await get_tree().create_timer(1.0).timeout
	time_stop_cooldown = false
	print("Time Stop is ready.")
