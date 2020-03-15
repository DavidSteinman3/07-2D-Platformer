extends Button

const FILE_NAME = "user://game-data.json"

var player = {
	"score": 0,
	"level": 1,
	}
	
func save():
	var file = File.new()
	file.open(FILE_NAME, File.WRITE)
	file.store_string(to_json(player))
	file.close()