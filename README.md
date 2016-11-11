# trapeze_team

### Project Description
Mechanical system of a trapeze artist in MATLAB.  
Created by Team Pulling an America for ModSim 2016 at Olin College of Engineering.

### Physical System

#### Effects
- ~~time dilation~~
- air resistance
  - ~~altitude (air density)~~
  - ~~humidity~~
  - ~~temperature~~
- gravity
  - ~~tidal forces from the moon~~
- transfer of momentum between trapeze artists

### Potential Questions
- How many backflips can the artist do from a given height before landing?
- What angle/time should they release at to complete a given "trick"?
- How long/high does your vine have to be to swing over Niagara Falls?

### Abstractions

#### Assumptions
- bodies don't rotate
- artist won't do work/contribute to velocity

#### 1st Iteration
- rigid pendulum for trapeze
- point mass for artist
- fixed landing location

#### 2nd Iteration
- landing location is swinging trapeze (rigid pendulum)

#### 3rd Iteration
- artist as rigid body
- landing location as second rigid body on rigid pendulum

### Predictions

#### X and Y positions over time
- parabolic arcs that vary with different launch times/angles
