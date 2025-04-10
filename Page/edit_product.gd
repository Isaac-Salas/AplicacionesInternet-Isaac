extends Control
class_name EditProduct
@onready var edit = $".."
@onready var CurrentDoc : FirestoreDocument
@onready var item_list : ItemList = $VBoxContainer/Foto/ItemList

@onready var Nomtext = $VBoxContainer/Nombre/TextEdit
@onready var IDtext = $VBoxContainer/ID/TextEdit
@onready var Cattext = $VBoxContainer/Category/TextEdit
@onready var Pricetext = $VBoxContainer/Price/TextEdit
@onready var Quanttext = $VBoxContainer/Quantity/TextEdit
@onready var Unittext = $VBoxContainer/Unit/TextEdit
@onready var Exptext = $VBoxContainer/Exp_Date/TextEdit
@onready var Treshtext = $VBoxContainer/Treshold/TextEdit

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

func _on_edit_close_requested():
	edit.visible = false

func UpdateBoxes():
	#print(CurrentDoc)
	var Keycount : int = 0
	var DocId = CurrentDoc.doc_name
	var Cleandoc = CurrentDoc.document
	print(Cleandoc)
	var catdicclean = Cleandoc.get(Keys[0])
	var catdata = catdicclean.values()
	Cattext.text = str(catdata[0])
	var expdicclean = Cleandoc.get(Keys[1])
	var expdata = expdicclean.values()
	Exptext.text = str(expdata[0])
	var iddicclean = Cleandoc.get(Keys[2])
	var iddata = iddicclean.values()
	IDtext.text = str(iddata[0])
	var namdicclean = Cleandoc.get(Keys[3])
	var namdata = namdicclean.values()
	Nomtext.text = str(namdata[0])
	var phodicclean = Cleandoc.get(Keys[4])
	var phodata = phodicclean.values()
	item_list.select(int(phodata[0]))
	var pricedicclean = Cleandoc.get(Keys[5])
	var pricedata = pricedicclean.values()
	Pricetext.text = str(pricedata[0])
	var quantdicclean = Cleandoc.get(Keys[6])
	var quantdata = quantdicclean.values()
	Quanttext.text = str(quantdata[0])
	var tresdicclean = Cleandoc.get(Keys[7])
	var tresdata = tresdicclean.values()
	Treshtext.text = str(tresdata[0])
	var unidicclean = Cleandoc.get(Keys[8])
	var unidata = unidicclean.values()
	Nomtext.text = str(unidata[0])
