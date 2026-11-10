extends Node2D


const save_path = "user://userdata.save"


var resource = 0



signal resource_changed


func save_data():
	var data = {
		"resource" : resource
	}
	var file = FileAccess.open(save_path , FileAccess.WRITE)
	file.store_var(data)
	file.close()


func load_data():
	if FileAccess.file_exists(save_path):
		var file = FileAccess.open(save_path , FileAccess.READ)
		var data = file.get_var()
		file.close()
		if typeof(data) == TYPE_DICTIONARY:
			resource = data.get("resource" , 0)
	else:
		save_data()




func _ready():
	load_data()
