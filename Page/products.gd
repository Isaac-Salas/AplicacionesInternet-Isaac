extends ColorRect
class_name ProductAddTemp
@export var Tabla : TablaTemplate

@onready var add_product = $"../../AddProduct"



func _on_add_product_pressed():
	add_product.visible = true


func _on_window_close_requested():
	add_product.visible = false
