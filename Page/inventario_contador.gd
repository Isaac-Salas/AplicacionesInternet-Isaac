extends Control
@export var Table : TablaTemplate
@onready var cat_text = $VBoxContainer/HBoxContainer/CatText
@onready var prod_text = $VBoxContainer/HBoxContainer/ProdText
@onready var Checkdic : Dictionary
@onready var search_text = $VBoxContainer/HBoxContainer2/TextEdit
@onready var search_btn = $VBoxContainer/HBoxContainer2/Search


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
			
		
			




func _on_search_toggled(toggled_on):
	if toggled_on == true:
		if Table != null:
			var search = search_text.get_line(0)
			var vchildren  = Table.v_box_container.get_children()
			for rows : RowClass in vchildren:
				var compare = rows.currDic.get("Name")
				#print(compare)
				if compare == search:
					pass
				else:
					rows.visible = false
	else:
		var vchildren  = Table.v_box_container.get_children()
		for rows : RowClass in vchildren:
			rows.visible = true
