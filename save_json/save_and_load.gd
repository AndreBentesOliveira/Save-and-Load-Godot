extends Node


var save_path = "user://score.save"

func save_score(hight_score_node):
	var file = File.new()
	file.open(save_path, File.WRITE)
	var node_data = hight_score_node.call("save")
	print("Node data: " + str(node_data))
	file.store_line(to_json(node_data))
	file.close()
	print(file)


func load_score():
	var file = File.new()
	if not file.file_exists(save_path):
		return # Error! We don't have a save to load.
	
	file.open(save_path, File.READ)
	while file.get_position() < file.get_len():
		var node_data = parse_json(file.get_line())
		return node_data
