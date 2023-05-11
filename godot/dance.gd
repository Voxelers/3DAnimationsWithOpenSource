extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	$ClaireDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
	$TuyDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
	
	var newTuy = $TuyDance.duplicate()
	var newClaire = $ClaireDance.duplicate()
	
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
