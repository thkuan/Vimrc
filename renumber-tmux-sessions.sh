#!/bin/bash

all_session_num=$(tmux ls | grep '^[0-9]\+:' | cut -f1 -d':' | sort)

new_num=0
for old_num in $all_session_num
do
    tmux rename -t $old_num $new_num
    ((new_num++))
done
