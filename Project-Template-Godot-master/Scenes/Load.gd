extends Button

var save_path = "res://save-file.cfg"
var config = ConfigFile.new()

var load_response = config.load(save_path)

