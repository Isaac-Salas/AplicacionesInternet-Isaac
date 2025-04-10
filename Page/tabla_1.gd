extends PanelContainer
class_name TablaTemplate

@onready var v_box_container = $ScrollContainer/VBoxContainer

const ROW_TEMPLATE = preload("res://Page/RowTemplate.tscn")
@onready var ArrayOfDics : Array


@export var Keys : Array = [
	"Category",
	"Exp_date" ,
	"ID" ,
	"Name", 
	"Photo",
	"Price" ,
	"Quantity",
	"Treshold",
	"Unit",
]

func _ready():
	await readData()
	addRows(ArrayOfDics)

func addRows(DicArray : Array):
	for Dic : Dictionary in DicArray:
		var newrow : RowClass = ROW_TEMPLATE.instantiate()
		v_box_container.add_child(newrow)
		newrow.updateValues(Dic)
		



func readData():
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
		#print(doc.document)
		var docdict : Dictionary = doc.document
		var unpackeddict = docdict.values()
		var BufferDict : Dictionary
		#print(str("Dictionary: ", unpackeddict, "/n"))
		for data in unpackeddict:
		#print(data.values())
			var valueclean = data.values()
			
			BufferDict.merge({Keys[keycount] : valueclean[0] })
			if keycount < (Keys.size() - 1):
				keycount += 1
			else:
				keycount = 0
				ArrayOfDics.append(BufferDict)
				
		
		#print(BufferDict)
		

func refresh():
	var children = v_box_container.get_children()
	for i in children:
		i.queue_free()
	await  readData()
	addRows(ArrayOfDics)

	
	
		

	
