# ROS-Path-Planning
## Project description
In this project, distance sensor on the Turtlebot3 determines the distance of the nearest obstacle around the Turtlebot3. If this distance is less than a certain threshold, a wall is determined to exist at the current cell in that direction, and this information is logged. Knowledge of the environment is then updated simultaneously as the robot attempts to approach the destination and explore more areas in the environment.

The environment is divided into a 9x9 grid, where each cell will be a node. The Breadth First Search (BFS) algorithm with early termination will be implemented to determine the path of smallest weight (or the path with least number of edges) to travel from the destination cell to all other cells in the grid. Whenever a new wall is discovered, the BFS algorithm is performed again to update the path.

Lastly, at each cell, the robot will determine which of its adjacent cell to travel to next to approach the destination cell. The adjacent cell with lowest total weight from the destination cell will be chosen as the target, and PID control will be implemented for the robot to approach that cell. This is repeated until the destination cell is reached.

## Features
1. BFS performs in O(V+E) time which is sufficiently efficient enough to be computed on the Raspberry Pi on board the Turtlebot3.
2. The BFS and obstacle detection algorithm is optimised to be performed only when necessary in this environment to reduce unnecessary computation. Both algorithms are only ran when the Turtlebot3 is closer to the center of each cell to avoid errors in detection of obstacles.
3. Movements of the Turtlebot3 to diagonally adjacent cells is possible to reduce the net time required to reach each destination cell.