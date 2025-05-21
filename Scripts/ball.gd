extends RigidBody3D
var original_position : Vector3
var fell : bool = false 



func _ready() -> void:
	original_position = position 
	updateUI()
	
	
func _process(delta: float) -> void:
	if position.y < -5 && not fell:
		fell = true
		die()
	
func die():
	if PlayerStats.lives > 1 :
		PlayerStats.lives -= 1
		respawn()
		updateUI()
	else :
		PlayerStats.lives -= 1
		get_tree().change_scene_to_file("res://Scenes/gameOver.tscn")
		print("Game Over")
		updateUI()
	
func respawn():
	position = original_position
	linear_velocity = Vector3.ZERO
	angular_velocity = Vector3.ZERO
	fell = false
	

func updateUI() :
	$CanvasLayer/Control/Lives.text = "Lives : " + str(PlayerStats.lives)
