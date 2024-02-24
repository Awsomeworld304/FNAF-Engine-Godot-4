extends Control

func _ready():
	pass

func _process(delta):
	$ParallaxBackground.scroll_offset=get_global_mouse_position()*delta;
	pass


func _on_newgame_button_up():
	
	pass # Replace with function body.


func _on_continue_button_up():
	pass # Replace with function body.
