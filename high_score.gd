extends VBoxContainer

var save_dict = {
		"time" : "01:34",
		"enemys_kill" : 10,
		"level" : 5
	}

func update_values():
	var load_score = SaveAndLoad.load_score()
	if get_node("%EnemysKill").value > load_score.enemys_kill:
		save_dict.enemys_kill = get_node("%EnemysKill").value
	if get_node("%Level").value > load_score.level:
		save_dict.level = get_node("%Level").value
	#save_dict.time = get_node("%Time").text
	
	


func save():
	return save_dict


func _on_UpdateValueButton_pressed() -> void:
	update_values()
