#!/usr/bin/env sh

layout_name="layout_name"

tmux has-session -t $layout_name

# Validate if session is already there
if [ $? != 0 ]; then
    # Create a new session
    tmux new-session -s $layout_name -n $layout_name -d

    # First pane
    tmux send-keys -t $layout_name ". devel/setup.bash" C-m  
    tmux send-keys -t $layout_name "cd src/path_plan/bin" C-m
    tmux send-keys -t $layout_name "./noetic_project_init_world_1.sh" C-m

    # Add pane
    tmux split-window -v -t $layout_name
    tmux send-keys -t $layout_name  ". devel/setup.bash" C-m    
    tmux send-keys -t $layout_name "sleep 10; roslaunch path_plan start_bot_control.launch" C-m

    # Add pane
    tmux split-window -h -t $layout_name
    tmux send-keys -t $layout_name  ". devel/setup.bash" C-m
    tmux send-keys -t $layout_name  "sleep 10; rosrun path_plan range_detect_node" C-m


    # Add pane
    tmux split-window -v -t $layout_name
    tmux send-keys -t $layout_name  ". devel/setup.bash" C-m
    tmux send-keys -t $layout_name "sleep 10; rosrun path_plan path_plan_node" C-m

    # # Add pane
    # tmux split-window -h -t $layout_name
    # tmux send-keys -t $layout_name 'sleep 10; rostopic echo -p /pathplan/target > target.csv' C-m

    # # Add pane
    # tmux split-window -v -t $layout_name
    # tmux send-keys -t $layout_name 'sleep 10; rostopic echo -p /pathplan/curr > curr.csv' C-m

    # Select tiled layout
    tmux select-layout tiled
fi

tmux attach -t $layout_name
