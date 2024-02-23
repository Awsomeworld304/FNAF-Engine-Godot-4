extends Control

func _ready():
	pass

func _process(delta):
	$ParallaxBackground.scroll_offset=get_global_mouse_position()*delta;
	pass
