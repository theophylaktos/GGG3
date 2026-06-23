extends Area2D

#var time = 0.0
#var initialY = 0.0
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#initialY = sprite_2d.global_position.y
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#time += delta
	#position.y = initialY + sin(time * 2.0) * 100.0
	#print(sprite_2d.global_position.y)

func _on_body_entered(body):
	if get_meta("part") == "one":
		PlayerStats.part1pickedup = true
	if get_meta("part") == "two":
		PlayerStats.part2pickedup = true
	if get_meta("part") == "three":
		PlayerStats.part3pickedup = true
	print(PlayerStats.part1pickedup,PlayerStats.part2pickedup,PlayerStats.part3pickedup)
