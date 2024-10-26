extends Control


func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	var json = JSON.parse_string(body.get_string_from_utf8())
	for i in range(json.number):
		print(json.people[i].name)


func _on_button_pressed() -> void:
	$Button/HTTPRequest.request_completed.connect(_on_http_request_request_completed)
	$Button/HTTPRequest.request("http://api.open-notify.org/astros.json")
