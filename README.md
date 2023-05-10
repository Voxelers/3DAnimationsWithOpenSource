# 3D Animations with Open Source

In this repository you will find the Godot and Blender files that will be used
during the workshop.

* [Workshop description](https://propuestas.eslib.re/2023/talleres/3d-animations-open-source)
* [Workshop slides](https://docs.google.com/presentation/d/1eVEjve3vur9weagTb7OHAgxgwp4cCMC-4seDLhxwhcU/edit#slide=id.p)

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
* Add a StaticBody node to the Root node (Initial)
  * Move inside it the Box
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape
      * Click in BoxShape and define the same size as the floor: 10, 1, 10
* Add a RigidBody3D node to the Root node (Initial)
  * Move inside it the Sphere
  * Add to this node a CollisionShape3D
    * In the properties select BoxShape
      * Click in BoxShape and select SphereShape. Position it at 0, 5, 0
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


## Combining scenes


## Adding collision detection



## An example Character model in Blender with metaballs
