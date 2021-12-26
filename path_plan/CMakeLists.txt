cmake_minimum_required(VERSION 3.0.2)
project(path_plan)

## Compile as C++11, supported in ROS Kinetic and newer
add_compile_options(-std=c++11)

## Find catkin macros and libraries
## if COMPONENTS list like find_package(catkin REQUIRED COMPONENTS xyz)
## is used, also find other catkin packages
find_package(catkin REQUIRED
  roscpp
  sensor_msgs
  nav_msgs
  geometry_msgs
  std_msgs
)

###################################
## catkin specific configuration ##
###################################
## The catkin_package macro generates cmake config files for your package
## Declare things to be passed to dependent projects
## INCLUDE_DIRS: uncomment this if your package contains header files
## LIBRARIES: libraries you create in this project that dependent projects also need
## CATKIN_DEPENDS: catkin_packages dependent projects also need
## DEPENDS: system dependencies of this project that dependent projects also need
catkin_package(
  INCLUDE_DIRS include
  CATKIN_DEPENDS
    roscpp
    sensor_msgs
    nav_msgs
    geometry_msgs
    std_msgs
)

###########
## Build ##
###########

## Specify additional locations of header files
## Your package locations should be listed before other locations
include_directories(
    include
    ${catkin_INCLUDE_DIRS}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
add_executable(
    range_detect_node
    src/range_detect_node.cpp
    src/RangeDetect.cpp
)

## Specify libraries to link a library or executable target against
target_link_libraries(
    range_detect_node
    ${catkin_LIBRARIES}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
add_executable(
    path_plan_node
    src/path_plan_node.cpp
    src/PathPlan.cpp
)

## Specify libraries to link a library or executable target against
target_link_libraries(
    path_plan_node
    ${catkin_LIBRARIES}
)

## Declare a C++ executable
## With catkin_make all packages are built within a single CMake context
## The recommended prefix ensures that target names across packages don't collide
add_executable(
    bot_control_node
    src/bot_control_node.cpp
    src/BotControl.cpp
)

## Specify libraries to link a library or executable target against
target_link_libraries(
    bot_control_node
    ${catkin_LIBRARIES}
)
