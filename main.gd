extends Control

var roomId: String
var players = []
func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	roomId = json.room.ID
	print(roomId)
	for i in range(json.players):
		players.append(json.room.player[i])
	print (players)
	if json.Acknowledge == True:
		print("Acknowledge")
	


func _on_button_pressed() -> void:
	$Button/HTTPRequest.request_completed.connect(_on_http_request_request_completed)
	$Button/HTTPRequest.request("http://api.open-notify.org/astros.json")
