extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if get_meta("part") == "one":
		PlayerStats.part1pickedup = true
	if get_meta("part") == "two":
		PlayerStats.part2pickedup = true
	if get_meta("part") == "three":
		PlayerStats.part3pickedup = true
	print(PlayerStats.part1pickedup,PlayerStats.part2pickedup,PlayerStats.part3pickedup)
