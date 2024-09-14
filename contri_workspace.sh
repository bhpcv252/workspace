#!/bin/bash

# Kill existing session if it exists
tmux kill-session -t contri_session 2>/dev/null

# Start a new tmux session with the first window
tmux new-session -d -s contri_session

# Rename the 'backend' window
tmux rename-window -t contri_session:1 "backend"

# Split the 'backend' window vertically
tmux split-window -v -t contri_session:1

# Resize the upper pane by defualt
tmux resize-pane -t contri_session:1.1 -y 10

# In the upper pane of 'backend', navigate to Contri Backend and open Neovim
tmux send-keys -t contri_session:1.1 "cd ~/Documents/my-projects/contri-app/contri-backend" C-m
tmux send-keys -t contri_session:1.1 "nvim" C-m

# In the lower pane of 'backend', navigate to Contri Backend
tmux send-keys -t contri_session:1.2 "cd ~/Documents/my-projects/contri-app/contri-backend" C-m

# Open a new window 
tmux new-window -t contri_session:2

# Rename the 'frontend' window
tmux rename-window -t contri_session:2 "frontend"

# Split the 'frontend' window vertically
tmux split-window -v -t contri_session:2

# Resize the upper pane by default
tmux resize-pane -t contri_session:2.1 -y 10

# In the upper pane of 'frontend', navigate to Contri Frontend and run the composer command
tmux send-keys -t contri_session:2.1 "cd ~/Documents/my-projects/contri-app/contri-frontend" C-m
# tmux send-keys -t contri_session:2.1 "nvim" C-m

# In the lower pane of 'frontend', navigate to Contri Frontend and run the ssh command
tmux send-keys -t contri_session:2.2 "cd ~/Documents/my-projects/contri-app/contri-frontend" C-m
# tmux send-keys -t contri_session:2.2 "nvm use 20" C-m
# tmux send-keys -t contri_session:2.2 "npm i" C-m

# Open a new window 
tmux new-window -t contri_session:3

# Rename the 'Redis Server' window
tmux rename-window -t contri_session:3 "Redis Server"

# Split the 'Redis Server' window vertically
tmux split-window -v -t contri_session:3

# In the upper pane of 'Redis Server', navigate to Home and restart redis server 
tmux send-keys -t contri_session:3.1 "cd ~" C-m
tmux send-keys -t contri_session:3.1 "redis-cli shutdown" C-m
tmux send-keys -t contri_session:3.1 "redis-server" C-m

# In the lower pane of 'Redis Server', navigate to Home and open space to run redis commands 
tmux send-keys -t contri_session:3.2 "cd ~" C-m


# Attach to the tmux session
tmux attach-session -t contri_session

