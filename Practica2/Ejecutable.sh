#!/bin/bash

gnome-terminal --tab --title="Terminal adicional" -- bash -c '
    echo "Presiona Enter para terminar todos los procesos...";
    read;
    killall -9 roscore;
    killall -9 roslaunch;
    killall -9 rosrun;
    killall -9 gnome-terminal;
    killall gzserver;
    killall gzclient; 
    exec bash'

# Directorio al que deseas navegar
directorio="Projecto/catkin_ws"

# Navegar al directorio
cd "$directorio"

# Verificar si la navegación fue exitosa
if [ $? -eq 0 ]; then
  echo "Se ha navegado al directorio: $directorio"

  rm -rf build devel

  cd "src/"

  rm "CMakeLists.txt"

  cd ..

  gnome-terminal --tab --title="Roscore" -- bash -c '
  roscore
  exec bash' &

  PID=$!

  # Esperar a que los nodos de ROS se carguen completamente
  while ! rosnode list &>/dev/null; do
    sleep 1
  done

  # Verificar si roslaunch ha terminado de cargar
  if [ $? -eq 0 ]; then
    echo "roslaunch se ha cargado completamente."

    # Ejecutar comandos en el directorio
    catkin_make
    export TURTLEBOT3_MODEL=waffle
    source devel/setup.bash
    roslaunch --wait load_model init.launch &
    
    sleep 20

    gnome-terminal --wait --tab --title="Controles" -- bash -c '
    export TURTLEBOT3_MODEL=waffle;
    source devel/setup.bash;
    roslaunch turtlebot3_teleop turtlebot3_teleop_key.launch;
    exec bash' &

    gnome-terminal --wait --tab --title="Camara nubes de puntos" -- bash -c '
    export TURTLEBOT3_MODEL=waffle
    source devel/setup.bash
    rosrun get_pointclouds get_pointclouds_node
    exec bash'
  else
    echo "roslaunch no se pudo cargar completamente."
  fi

else
  echo "No se pudo navegar al directorio: $directorio"
fi
