# ROS-Path-Planning
## Project description
In this project, distance sensor on the Turtlebot3 determines the distance of the nearest obstacle around the Turtlebot3. If this distance is less than a certain threshold, a wall is determined to exist at the current cell in that direction, and this information is logged. Knowledge of the environment is then updated simultaneously as the robot attempts to approach the destination and explore more areas in the environment.

The environment is divided into a 9x9 grid, where each cell will be a node. The Breadth First Search (BFS) algorithm with early termination will be implemented to determine the path of smallest weight (or the path with least number of edges) to travel from the destination cell to all other cells in the grid. Whenever a new wall is discovered, the BFS algorithm is performed again to update the path.

Lastly, at each cell, the robot will determine which of its adjacent cell to travel to next to approach the destination cell. The adjacent cell with lowest total weight from the destination cell will be chosen as the target, and PID control will be implemented for the robot to approach that cell. This is repeated until the destination cell is reached.

![image](https://user-images.githubusercontent.com/77652228/147397924-edd0309c-8693-4fde-863d-4dfe5b00713b.png)

This project is ran on ROS Noetic and ROS Gazebo using C++

## Features
1. BFS performs in O(V+E) time which is sufficiently efficient enough to be computed on the Raspberry Pi on board the Turtlebot3.
2. The BFS and obstacle detection algorithm is optimised to be performed only when necessary in this environment to reduce unnecessary computation. Both algorithms are only ran when the Turtlebot3 is closer to the center of each cell to avoid errors in detection of obstacles.
3. Movements of the Turtlebot3 to diagonally adjacent cells is possible to reduce the net time required to reach each destination cell.

## ROS Nodes and Topics
![image](https://user-images.githubusercontent.com/77652228/147397929-9db78ce4-dbb7-45ac-8660-878dd0d354f8.png)

## Instructions
Edit the destination cell location by changing line 9 and 10 (GOAL_X and GOAL_Y) in path_plan/include/PreDefine.hpp, 
```
#define GOAL_X 4 //target position
#define GOAL_Y 4 //target position
```
and line 413 in path_plan/worlds/test_world_1.world.
```
<pose frame=''>4.5 4.5 -0.04990 0 -0 0</pose>
```

Run the simulation according to the following steps.

### Step 1: Create a workspace
```
mkdir workspace_name
cd workspace_name
mkdir src
catkin_make
```
### Step 2: Add the path_plan package into the src folder
### Step 3: Add the run.sh file into the workspace
### Step 4: Build the package and source the workspace
```
catkin_make
source ./devel/setup.bash
```
### Step 5: Run the simulation
```
bash run.sh
```
