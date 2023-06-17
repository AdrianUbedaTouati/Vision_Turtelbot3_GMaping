Primera terminal:
roscore

Segunda termina:
catkin_make
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
roslaunch load_model init.launch 

Tercera terminal: 
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch

Cuarta terminal:
export TURTLEBOT3_MODEL=waffle
source devel/setup.bash
rosrun get_pointclouds get_pointclouds_node
darle r

Enfocar otra forma... intentar aplicar los metodos en el codigo original...

