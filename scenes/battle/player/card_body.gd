extends Sprite2D

@export
var base_texture : Texture2D
@export
var select_texture : Texture2D

func select():
	texture = select_texture
	
func deselect():
	texture = base_texture
