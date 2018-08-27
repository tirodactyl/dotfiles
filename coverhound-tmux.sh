#!/bin/sh
#
# Setup a work space called `work` with two windows first window has 3 panes.
# The first pane set at 65%, split horizontally, set to api root and running vim
# pane 2 is split at 25% and running redis-server
# pane 3 is set to api root and bash prompt.
# note: `api` aliased to `cd ~/path/to/work`

session="work"

# set up tmux
tmux start-server

# create a new tmux session, starting vim from a saved session in the new window
tmux new-session -d -s $session -n servers #"vim -S ~/.vim/sessions/kittybusiness"

# Select pane 1, set dir coverhound
tmux selectp -t 1
tmux send-keys "cd ~/dev/coverhound" C-m

# Split pane 1 horizontal by 70%, select pane 2, start mysql server
tmux splitw -h -p 30
tmux selectp -t 2
tmux send-keys "mysql.server start" C-m

# Split pane 2 vertiacally by 5%
tmux splitw -v -p 95

# select pane 3, start redis-server
tmux selectp -t 3
tmux send-keys "redis-server" C-m

# Split pane 2 vertiacally by 50%
tmux splitw -v -p 50

# select pane 4, start sidekiq
tmux selectp -t 4
tmux send-keys "cd ~/dev/coverhound;bundle exec sidekiq" C-m

# Select pane 1
tmux selectp -t 1

# create a new window called vim
tmux new-window -t $session:1 -n vim

# Select pane 1, set dir to api, run vim
tmux selectp -t 1
tmux send-keys "cd ~/dev/coverhound;vim ." C-m

# create a new window called scratch
tmux new-window -t $session:2 -n scratch

# Select pane 1, set dir to api
tmux selectp -t 1

# create a new window called pianobar
tmux new-window -t $session:3 -n pianobar

# Select pane 1, set dir to api, run pianobar
tmux selectp -t 1
tmux send-keys "pianobar" C-m

# return to main vim window
tmux select-window -t $session:1

# Finished setup, attach to the tmux session!
tmux attach-session -t $session
