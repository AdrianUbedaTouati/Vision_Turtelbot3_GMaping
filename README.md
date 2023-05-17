(en cada terminal nueva)
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash

Primera terminal:
en catkin_ws$
 
roscore

Segunda termina:
en catkin_ws$ 

catkin_make
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
roslaunch load_model init.launch 

Tercera terminal:
en catkin_ws$ 

export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

Cuarta terminal:
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
rosrun get_pointclouds get_pointclouds_node
darle r

Nos guardamos 10 fotos
sale 1 cada x tiempo
La practica va de combinar esas 10 fotos 

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
