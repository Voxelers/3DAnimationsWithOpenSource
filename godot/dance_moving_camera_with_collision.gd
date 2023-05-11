extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ClaireRigidBody3D/ClaireDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
	$TuyRigidBody3D/TuyDance/AnimationPlayer.play("Armature|mixamocom|Layer0")

	var newClaire = $ClaireRigidBody3D/ClaireDance.duplicate()	
	var newTuy = $TuyRigidBody3D/TuyDance.duplicate()
	
	newTuy.position = Vector3(0, 0, -2)
	newTuy.find_child('AnimationPlayer').play("Armature|mixamocom|Layer0")
	newClaire.position = Vector3(0, 0, 2)
	newClaire.find_child('AnimationPlayer').play("Armature|mixamocom|Layer0")
	
	var danceRoot = get_node(".")
	danceRoot.add_child(newClaire)
	danceRoot.add_child(newTuy)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_claire_rigid_body_3d_body_entered(body):
	if body != $StaticBody3D:
		print(body)
		$AnimationPlayer.stop(true)
		$ClaireRigidBody3D/ClaireDance.rotate_y(deg_to_rad(90))
		$TuyRigidBody3D/TuyDance.rotate_y(deg_to_rad(-90))
		$ClaireRigidBody3D/ClaireDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
		$TuyRigidBody3D/TuyDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
		
