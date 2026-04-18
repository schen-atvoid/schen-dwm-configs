#!/bin/bash
# fix-monitors.sh - 双显示器设置 + ForceFullCompositionPipeline 防撕裂
 
xrandr --output HDMI-0 --off \
       --output DP-4 --mode 2560x1440 --rate 59.95 --pos 3840x134 --rotate normal --scale 1.3x1.3 \
       --output DP-1 --off \
       --output HDMI-1 --off \
       --output DP-2 --primary --mode 3840x2160 --rate 143.96 --pos 0x0 --rotate normal \
       --output DP-3 --off \
       --output DP-5 --off
 
sleep 1
 

nvidia-settings --load-config-only
nvidia-settings --assign CurrentMetaMode="DPY-4: 3840x2160_144 +0+0 {ForceFullCompositionPipeline=On}, DPY-6: 2560x1440_60 +3840+134 {ForceFullCompositionPipeline=On}"
nvidia-settings --assign SyncToVBlank=0

xrandr --output DP-4 --scale 1.3x1.3
