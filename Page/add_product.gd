extends Control
@onready var Nomtext : TextEdit = $VBoxContainer/Nombre/TextEdit
@onready var Idtext : TextEdit = $VBoxContainer/ID/TextEdit
@onready var Cattext : TextEdit = $VBoxContainer/Category/TextEdit
@onready var Pricetext : TextEdit = $VBoxContainer/Price/TextEdit
@onready var Quanttext : TextEdit = $VBoxContainer/Quantity/TextEdit
@onready var Unittext : TextEdit = $VBoxContainer/Unit/TextEdit
@onready var Exptext : TextEdit = $VBoxContainer/Exp_Date/TextEdit
@onready var Trestext : TextEdit = $VBoxContainer/Treshold/TextEdit
@onready var Photo_list : ItemList = $VBoxContainer/Foto/ItemList

@export var Table : TablaTemplate

@export var Keys : Array = [
	"Category",
	"Exp_Date" ,
	"ID" ,
	"Name", 
	"Photo",
	"Price" ,
	"Quantity",
	"Treshold",
	"Unit",
]


func addProduct():
	var firestore_collection : FirestoreCollection = Firebase.Firestore.collection("Productos")
	var data : Dictionary = {}
	var current : int = 0
	var photo = Photo_list.get_selected_items()
	var newDic : Dictionary = {
		Keys[0] : photo[0],
		Keys[1] : Nomtext.get_line(0),
		Keys[2] : Idtext.get_line(0),
		Keys[3] : Cattext.get_line(0),
		Keys[4] : Pricetext.get_line(0),
		Keys[5] : Quanttext.get_line(0),
		Keys[6] : Unittext.get_line(0),
		Keys[7] : Exptext.get_line(0),
		Keys[8] : Trestext.get_line(0),
	}
	
	await firestore_collection.add("", newDic)
	if Table != null:
		Table.refresh()
	
	return newDic


func clearstuff():
	Nomtext.clear()
	Idtext.clear()
	Cattext.clear()
	Pricetext.clear()
	Quanttext.clear()
	Unittext.clear()
	Exptext.clear()
	Trestext.clear()
	


func _on_discard_pressed():
	clearstuff()


func _on_add_pressed():
	var result = await addProduct()
	print(result)
