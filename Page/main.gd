extends Control
@onready var bigol_jelly = $BigolJelly


func _on_home_pressed():
	OS.shell_open("https://jellydogstudio.itch.io/")


func _on_dashboard_pressed():
	pass # Replace with function body.


func _on_jelly_qr_pressed():
	bigol_jelly.visible = true
