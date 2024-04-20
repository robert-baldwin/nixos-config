#!/usr/bin/env bash

# workspaces can be occupied or unoccupied
# one occupied workspace can be in focus
workspaces=(u u u u u u u u u u) # a=active, o=occupied, u=unoccupied
active_workspace=1 # initialize active workspace reference
# find currently occupied workspaces
for num in `hyprctl workspaces -j | jq .[].id`; do
  workspaces[$num-1]="o" # mark occupied
done

# find currently active workspace
for num in `hyprctl activeworkspace -j | jq .id`; do
  workspaces[$num-1]="a" # mark active
  active_workspace=$num # set active workspace reference
done

workspace_icon() {
  if [[ "${workspaces[$1-1]}" == "a" ]]; then
    echo "●"
  elif [[ "${workspaces[$1-1]}" == "o" ]]; then
    echo "○"
  elif [[ "${workspaces[$1-1]}" == "u" ]]; then
    echo "○"
  fi
}

workspace_class() {
  if [[ "${workspaces[$1-1]}" == "a" ]]; then
    echo "workspace-active"
  elif [[ "${workspaces[$1-1]}" == "o" ]]; then
    echo "workspace-occupied"
  elif [[ "${workspaces[$1-1]}" == "u" ]]; then
    echo "workspace-unoccupied"
  fi
}

# literal content used to generate eww widget
render() {
  echo $(cat << EOF
    (eventbox
      (box :class "workspaces" :orientation "h" :spacing 5 :space-evenly false
	(button :onclick "hyprctl dispatch workspace 1" :class "$(workspace_class 1)" "$(workspace_icon 1)")
	(button :onclick "hyprctl dispatch workspace 2" :class "$(workspace_class 2)" "$(workspace_icon 2)")
        (button :onclick "hyprctl dispatch workspace 3" :class "$(workspace_class 3)" "$(workspace_icon 3)")
        (button :onclick "hyprctl dispatch workspace 4" :class "$(workspace_class 4)" "$(workspace_icon 4)")
        (button :onclick "hyprctl dispatch workspace 5" :class "$(workspace_class 5)" "$(workspace_icon 5)")
        (button :onclick "hyprctl dispatch workspace 6" :class "$(workspace_class 6)" "$(workspace_icon 6)")
        (button :onclick "hyprctl dispatch workspace 7" :class "$(workspace_class 7)" "$(workspace_icon 7)")
        (button :onclick "hyprctl dispatch workspace 8" :class "$(workspace_class 8)" "$(workspace_icon 8)")
        (button :onclick "hyprctl dispatch workspace 9" :class "$(workspace_class 9)" "$(workspace_icon 9)")
        (button :onclick "hyprctl dispatch workspace 10":class "$(workspace_class 10)" "$(workspace_icon 10)")))
EOF
  )
}

# initial render
render

# listen to hyprland socket for relevant updates
socat -u UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - |
  while read -r event; do
    if [[ "${event:0:11}" == "workspace>>" && "${event:11}" =~ ^[0-9]+$ ]]; then
      workspaces[$active_workspace-1]="o" # set previously active workspace to occupied
      active_workspace=${event:11} # update active_workspace reference
      workspaces[$active_workspace-1]="a" # set new active workspace
      render
    elif [[ "${event:0:17}" == "createworkspace>>" && "${event:17}" =~ ^[0-9]+$ ]]; then
      workspaces[${event:17}-1]="o" # mark occupied
      render
    elif [[ "${event:0:18}" == "destroyworkspace>>" && "${event:18}" =~ ^[0-9]+$ ]]; then
      workspaces[${event:18}-1]="u" # mark unoccupied
      render
    fi
  done
