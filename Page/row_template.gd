extends HBoxContainer

class_name RowClass
@onready var products = $Products
@onready var buying_price = $BuyingPrice
@onready var quantity = $Quantity
@onready var treshold = $Treshold
@onready var exp_date = $Exp_Date
@onready var availability = $Availability
@onready var edit : Button = $Edit

@onready var currDic : Dictionary
@onready var ArrayOfDics : Array
@onready var currentDoc : FirestoreDocument


#@export var Keys : Array = [
	#"Name" ,
	#"ID" ,
	#"Category", 
	#"Price",
	#"Quantity" ,
	#"Unit",
	#"Exp_Date",
	#"Treshold",
#]

func updateValues(Dic : Dictionary):
	currDic = Dic
	products.text = str(Dic.get("Name"))
	buying_price.text = str(Dic.get("Price"))
	quantity.text = str(Dic.get("Quantity"))
	treshold.text = str(Dic.get("Treshold"))
	exp_date.text = str(Dic.get("Exp_date"))
	var quant : int = int(Dic.get("Quantity"))
	var tresh : int = int(Dic.get("Treshold"))
	if quant > tresh:
		availability.text = "Available"
		availability.add_theme_color_override("font_color",Color.AQUAMARINE)
	if quant <= tresh:
		availability.text = "Low Stock"
		availability.add_theme_color_override("font_color",Color.YELLOW)
	if quant == 0:
		availability.text = "Out Of Stock"
		availability.add_theme_color_override("font_color",Color.CRIMSON)
	
	
	edit.flat = false
	edit.disabled = false




func _on_edit_button_down():
	currentDoc = await find_doc()
	#print(currentDoc)
	var editwindow = get_tree().get_first_node_in_group("Editor")
	editwindow.visible=true
	var editor : EditProduct = get_tree().get_first_node_in_group("EditInfo")
	editor.CurrentDoc = currentDoc
	editor.UpdateBoxes()
	

func find_doc():
		
	ArrayOfDics = []
	var collection: FirestoreCollection = Firebase.Firestore.collection("Productos")
	var query : FirestoreQuery = FirestoreQuery.new()
	var keycount : int = 0
	query.from("Productos")
	#query.select(Allinfo)
	#print(query)
	var results = await Firebase.Firestore.query(query)
	
	#print(results)
	for doc : FirestoreDocument in results:
		var cleandoc = doc.document 
		var cleandic = cleandoc.get("Name")
		var cleaname = cleandic.values()
		print(cleaname[0])
		
		if cleaname[0] == currDic.get("Name"):
			#print(doc)
			return doc
			
		
		#print(BufferDict)
		
