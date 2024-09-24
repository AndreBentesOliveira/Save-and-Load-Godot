extends Control

export(NodePath) var player_path

var PlayerNode:Node
var save_path := "user://player_data.tres" # <- tres is Text RESource


func _ready() -> void:
	PlayerNode = get_node(player_path)
	save_data()
	load_data()

func save_data() -> void:
	var data := PlayerData.new()
	data.name = PlayerNode.player_name
	data.health = PlayerNode.health
	data.points = PlayerNode.points

	var error := ResourceSaver.save(save_path, data)
	if error:
		print("An error happened while saving data: ", error)


func load_data() -> void:
	var data:PlayerData = load(save_path)
	PlayerNode.player_name = data.name
	PlayerNode.health = data.health
	PlayerNode.points = data.points
	print(PlayerNode.player_name, PlayerNode.health, PlayerNode.points)
