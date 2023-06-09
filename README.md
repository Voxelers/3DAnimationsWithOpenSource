# 3D Animations with Open Source Workshop

In this repository you will find the Godot and Blender files that will be used
during the workshop.

* [Workshop description](https://propuestas.eslib.re/2023/talleres/3d-animations-open-source)
* [Workshop slides](https://docs.google.com/presentation/d/1eVEjve3vur9weagTb7OHAgxgwp4cCMC-4seDLhxwhcU/edit#slide=id.p)

All the workshop is covered by this [LICENSE](LICENSE) except [Mixamo](https://helpx.adobe.com/es/creative-cloud/faq/mixamo-faq.html) &copy; contents which are free to use.

## Initial scene in Godot

* Start from the empty 3D world
* Add a Node3D (3D Scene)
* Add a floor using the Box (CSGBox3D)
  * Set the dimensions (Size: 10, 1, 10)
  * Zoom out (mouse wheel) to see the floor
* Add a Sphere
  * Set the position (Transform -> Position: 0, 5, 0)
* Configure 2 view (View->2 View ports alt)
* Add a camera
  * Click on Preview in the second view
  * Set the position
    * You can move the camera using the color arrows to view the scene
    * Or you can move it directly to  0, 4, 20
* Add the SUN and the World Environment using the menu displayed clicking in the 3 buttons over the 3D view
* Save the scene as initial.tscn
* Press in the Top right second Play button (F6) to start the "game"
  * You should see the same as in the Camera Preview view

## First animation scene in Godot

* Save the previous scene as "initial_animation.tscn"
* Add a new Node "AnimationPlayer"
* In the Animation Player press in "Animation" button to create a new animation. Call it "new_animation"
* Select the sphere and in the properties Inspector panel, click in the key icon next to Transform->Position
  * Confirm the creation of the key
* In the animation player go to second 1 
* Select the sphere and in the properties Inspector panel, change the y position to 0 in Transform->Position->y and click in the key icon next to Transform->Position
* Press in Play in the Animation Player and check that the sphere goes from y=5 in second 0 to y=0 in second 1

## Animation scene in Godot based on physics

* Save the initial scene as "initial_physics.tscn"
* Add a StaticBody3D node to the Root node (Initial)
  * Move inside it the Box
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape3D
      * Click in BoxShape3D and define the same size as the floor: 10, 1, 10
* Add a RigidBody3D node to the Root node (Initial)
  * Move inside it the Sphere
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape3D
      * Click in BoxShape3D and select SphereShape. Position it at 0, 5, 0
* Press in the Top right second Play button (F6) to start the "game"
  * You must see the ball falling due to the gravity until it collides with the floor.

## Character model in Blender basic

* Remove the initial cube
* Build a basic character with
  * A sphere as head (use G+)
    * Add sphere
    * Move it to Location 0, 0, 6
  * Cubes for
    * The body
      * Scale Z to 2 and move to Location 0, 0, 3
    * The arms
      * Two boxes
        * Left arm: Scale 0.3, 1.5, 0.3 - Location 0, 2.5, 4.5
        * Right arm: Scale 0.3, 1.5, 0.3 - Location 0, -2.5, 4.5
    * The legs
      * Two boxes
        * Left leg: Scale 0.3, 1.5, 0.3 - Location 0, 1.5, 0 - Rotation -45, 0, 0
        * Right leg: Scale 0.3, 1.5, 0.3 - Location 0, 1.5, 0- Rotation 45, 0, 0
* Save the blender scene as "basic.blend"

## Animation rigging in Blender

* Save the blender scene as "basic_anim.blend"
* Add Armature (it adds an initial bone, which is the spine)
  * Change to Location 0, 0, 1.5 - Scale 3, 3, 3
* Change to Wireframe view (top right icon with an empty circle with wires) so you can see the armature
* Change to Edit Mode and create the rest of the skeleton
  * Select an extreme of the current bone en press "E"
  * From the upper extreme add 2 bones for the arms and 1 bone for the neck
  * From the bottom extreme add two bones for the legs
* Change to object mode and select all the cube for the model using CTRL+left-mouse-button and select also the armature as the last one
* Press right-mouse-button over the selection and select Parent->Armature deform->With automatic weights
* Go to Pose mode, select left leg bone, move it, and check that the left leg will also be moved. The bones move also the model.

## Creating animations in Blender based on the rigging

* Save the blender scene as "basic_anim_rigging.blend"
* Go to Pose Mode
* Select all the bones (a key)
* Press right-mouse-button->Insert KeyFrame->Location and Rotation
* Move the skeleton to the final desired position
* Go to second 5 in the Timeline view (drag it up from the bottom of the main window)
* Select all the bones (a key)
* Press right-mouse-button->Insert KeyFrame->Location and Rotation
* Go to second 1 and copy the keyframes
* Go to second 10 in the Timeline view and paste the second 1 keyframes
* Set the total duration for the timeline to 10s (100)
* Save the scene
* Export it as a glTF 2.0


## Using Blender animation in Godot: Import and coding
* Add a new scene to Godot with a 3D node and save it as blender_animation
* Add a camera, the SUN and the World Environment as before
  * Camera: Position 10, 2, 0 - Rotation: 0, 90, 0
* Drag and drop the "basic_anim_rigging.glb" file to resources panel (In the FileSystem tab)
* Drag the file from Godot resource panel to 3D view
* Add code to the scene so the animation is played
  * Select the root node and press the paper with a green +
    * Press the Create button in the modal dialog that appears
    * In the func _ready() add the code to start the animation
```
    func _ready():
      $basic_anim_rigging/AnimationPlayer.play("ArmatureAction")
```
* Press in the Top right second Play button (F6) to start the "game"
  * You must see the model animated

## Cinematic Scene Generation

* Godot can generate cinematics (video) from the scene
* Go to Project->Project Settings->Editor->Movie Writer and define where the movie file must be generated (basicRigging.avi)
* Then select the Film icon (the last one in the top right) and play the scene as usual

## Using Mixamo animations in Godot

* MoCap is powerfull to capture animations directly from the real world
  * Mixamo is a sample of it. The characters and animations are royalty free for personal, commercial, and non-profit projects ([FAQ](https://helpx.adobe.com/creative-cloud/faq/mixamo-faq.html)). Free as a beer.
  * Auto-rigger and animation libraries are for bipedal humanoids only.
* Go to https://www.mixamo.com/#/, create an account, select a character and an animation and download it
  * Use Ty character with Falling animation
  * Press Download button and use the default config (FBX format)
* Open Blender, remove the cube, import the Falling.fbx and export it as a glTF 2.0
* Open Godot project
  * Add a new scene to Godot with a 3D node and save it as mixamo_animation
  * Drag and drop the "Falling.glb" file to resources panel (In the FileSystem tab)
  * Drag and drop the file "Falling.glb" from Godot resource panel to 3D view
    * Position at 0, 10, 0
  * Add a camera, the SUN and the World Environment as before
    * Camera: Position 0, 0, 0 - Rotation: 90, 0, 0
  * Add code to the scene so the animation is played
    * Select the root node and press the paper with a green +
      * Press the Create button in the modal dialog that appears
      * In the func _ready() add the code to start the animation
```
  func _ready():
    $Falling/AnimationPlayer.play("Armature|mixamocom|Layer0")
```
  * Press in the Top right second Play button (F6) to start the "game"
    * You must see the model animated

## Add fall animation

* Open in Godot the mixamo_animation scene
* Save it as mixamo_animation_falls
* Add a RigidBody3D node to the Root node (Mixamo)
  * Move inside it the Falling node
* Change the scene code to
```gdscript
func _ready():
    $RigidBody3D/Falling/AnimationPlayer.play("Armature|mixamocom|Layer0")
```
* Press in the Top right second Play button (F6) to start the "game"
  * You must see the model animated falling

## Add fall animation with floor

* Open in Godot the mixamo_animation_falls scene
* Save it as mixamo_animation_falls_with_floor
* Add a floor using the Box (CSGBox3D)
  * Set the dimensions (Size: 10, 1, 10)
* Add a StaticBody3D node to the Root node (Mixamo)
  * Move inside it the Box
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape3D
      * Click in BoxShape3D and define the same size as the floor: 10, 1, 10
* In the RigidBody3D
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape3D
      * Click in BoxShape3D and define the same size to contain the Ty model: 1, 1, 3
    * Move it to Position 0, 11, 0 (Ty model must be inside it)
* Transform the camera to Location  0, 4, 10 - Rotation 0, 0, 0
* Press in the Top right second Play button (F6) to start the "game"
  * You must see the model animated falling
  * When Ty hits (collides) the floor he stopped
* Create a cinematic with it
  * Go to Project->Project Settings->Editor->Movie Writer and define where the movie file must be generated (TyFalling.avi)
  * Then select the Film icon (the last one in the top right) and play the scene as usual
* You can change the bounce property of the floor to simulate it is an elastic bed


## Combining several models: A dance party

* Create a new scene and save it as "dance.tscn", and add the flor of the previous scenes but with 0.1 for y size
* Import in the Godot project the models "ClaireDance" and "TuyDance" from the repository mixano folder
  * Position ClaireDance model at -3, 0.05, 0
  * Position TuyDance model at 3, 0.05, 0
* Add the AnimationPlayer node create a new animation with for 10s:
  * "ClaireDance" moving from its original position to 1, 0.05, 0 (only x changes) 
  * "TuyDance" moving from its original position to 1, 0.05, 0 (only x changes)
* Change the scene code to
```gdscript
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
```
* Press in the Top right second Play button (F6) to start the "game"
  * You must see four models dancing

## Combining several models: A dance party with moving camera

* Save the "dance.tscn" scene as "dance_moving_camera.tscn"
* Remove the script selecting the root node and pressing the paper icon with a red cross
* Add a new script pressing the paper icon with a green plus
  * Save ths script with the name "dance_moving_camera.gd"
  * Copy the "dance.gd" contents to "dance_moving_camera.gd"
* Select the camera node and animate it moving to Position 
  * At 5s to -2, 1.5, 3
  * At 10s to 0, 1.5, 2
* Press in the Top right second Play button (F6) to start the "game"
  * You must see four models dancing with the camera approaching the dance


## Combining several models: A dance party with collisions detection

* Let's create a new scene from "dance_moving_camera.tscn", "dance_moving_camera_collision.tscn"
* The goal is to detect a collision between the two dancers
  * When they "touch" they must stop dancing
  * They must rotate so they can look to each other
* In order to detect the collision let's create two RigidBody3D
  * Inside each RigidBody3D we move the character, and also we create a CollisionShape3D, box, with the character inside
  * The CollisionShape3D must be animated to be moved with the characters
  * In the RigidBody3D we need to activate the Contact Monitor property and change the Max Contacts Reported to 10
* Connect the RigidBody3D body_entered signal for one of the characters to this code
```gdscript
func _on_claire_rigid_body_3d_body_entered(body):
	if body != $StaticBody3D:
		print(body)
		$AnimationPlayer.stop(true)
		$ClaireRigidBody3D/ClaireDance.rotate_y(deg_to_rad(90))
		$TuyRigidBody3D/TuyDance.rotate_y(deg_to_rad(-90))
		$ClaireRigidBody3D/ClaireDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
		$TuyRigidBody3D/TuyDance/AnimationPlayer.play("Armature|mixamocom|Layer0")
```
* When the two characters collide they rotate to look to each other and the dance continues

 
## Combining scenes

## An example Character model in Blender with metaballs

## Blending animations
