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
  * Cubesgz for
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

## Character model in Blender with metaballs

## Using Blender animation in Godot: Import and coding

## Using Mixamo animations in Godot

## Cinematic Scene Generation
