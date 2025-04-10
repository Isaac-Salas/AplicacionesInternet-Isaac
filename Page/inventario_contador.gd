extends Control
@export var Table : TablaTemplate
@onready var cat_text = $VBoxContainer/HBoxContainer/CatText
@onready var prod_text = $VBoxContainer/HBoxContainer/ProdText
@onready var Checkdic : Dictionary

func _process(delta):
	if Table != null:
		var vchildren = Table.v_box_container.get_children()
		prod_text.text = str(vchildren.size())
		for rows : RowClass in vchildren:
			var cat = rows.currDic.get("Category")
			Checkdic.get_or_add(cat, "")
		
		var keys = Checkdic.keys()
		#print(keys)
		cat_text.text = str(keys.size())
			
		
			
