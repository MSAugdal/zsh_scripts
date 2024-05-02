#!/bin/zsh                                                                                                   

# defines session name
SESSIONNAME="Rust"
# checks if session exists
tmux has-session -t $SESSIONNAME &> /dev/null

# if session does not exist
if [ $? != 0 ] 
 then
    # goes to rustlings dir and open nvim in exercises dir
    tmux new-session -s $SESSIONNAME -n script -d
    tmux send-keys -t $SESSIONNAME "cd ~/Documents/Fritidsprogrammering/rustlings" C-m
    tmux send-keys -t $SESSIONNAME "nvim ./exercises" C-m

    # splits horizontally, goes to rustlings dir, resizes pane, executes "rustlings watch"
    tmux split-window -h -t $SESSIONNAME
    tmux send-keys -t $SESSIONNAME "cd ~/Documents/Fritidsprogrammering/rustlings" C-m
    tmux send-keys -t $SESSIONNAME "tmux resize-pane -R 20" C-m
    tmux send-keys -t $SESSIONNAME "rustlings watch" C-m

    # goes to nvim pane
    tmux last-pane -t $SESSIONNAME
fi

tmux attach -t $SESSIONNAME

