extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
    $basic_anim_rigging/AnimationPlayer.play("ArmatureAction")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
    pass
