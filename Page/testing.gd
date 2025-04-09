extends Control

@onready var rich_text_label = $RichTextLabel


func _on_test_pressed():
	#Testing unpacking stuff
	var collection: FirestoreCollection = Firebase.Firestore.collection("test")
	var document : FirestoreDocument = await collection.get_doc("ass")
	var data : Dictionary = document.document
	var unpackedata : Array = data.values()
	print(unpackedata)
	var unpackeddict : Dictionary = unpackedata[0]
	var unpackedvalues : Array = unpackeddict.values()
	var unpackedkeys : Array = unpackeddict.keys()
	print(unpackedvalues, unpackedkeys)
	
	
