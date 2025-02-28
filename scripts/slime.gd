extends Node2D

const velocity = 40
var direction = 1

@onready var ray_cast_left: RayCast2D = $RayCastLeft
@onready var ray_cast_right: RayCast2D = $RayCastRight
@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if ray_cast_left.is_colliding():
		direction = 1
	if ray_cast_right.is_colliding():
		direction = -1
	$AnimatedSprite2D.flip_h = direction < 0
	position.x += direction * velocity * delta


func _on_killzone_body_entered(body: Node2D) -> void:
	audio_stream_player_2d.play()
