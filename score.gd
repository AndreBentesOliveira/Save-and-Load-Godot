extends Node

export(NodePath) var hightscore_path
var hightscore_node


func _ready() -> void:
	hightscore_node = get_node(hightscore_path)
	


func _on_SaveButton_pressed() -> void:
	SaveAndLoad.save_score(hightscore_node)


func _on_LoadButton_pressed() -> void:
	$VBoxContainer/Label.text = str(SaveAndLoad.load_score())
