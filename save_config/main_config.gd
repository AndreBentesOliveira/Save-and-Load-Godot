extends Control


var config = ConfigFile.new()

func _ready() -> void:
	config.set_value("Player1", "player_name", "Steve")
	config.set_value("Player1", "best_score", 10)
	config.set_value("Player1", "health", 100)
	config.set_value("Player2", "player_name", "V3geta")
	config.set_value("Player2", "best_score", 9001)
	config.save("user://scores.cfg")
	load_data()


func load_data():
	var score_data = {}
	var config = ConfigFile.new()

# Load data from a file.
	var err = config.load("user://scores.cfg")

# If the file didn't load, ignore it.
	if err != OK:
		return

# Iterate over all sections.
	for player in config.get_sections():
		# Fetch the data for each section.
		var player_name = config.get_value(player, "player_name")
		var player_score = config.get_value(player, "best_score")
		score_data[player_name] = player_score
	print(score_data)
