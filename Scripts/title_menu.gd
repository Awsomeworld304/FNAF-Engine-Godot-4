extends Control

func _ready():
	pass

func _process(delta):
	pass


func _on_save_button_up():
	SaveTools.save_game();


func _on_load_button_up():
	SaveTools.load_save();
