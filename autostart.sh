#!/bin/bash

function run {
  if ! pgrep "$1" >/dev/null 2>&1; then
    "$@" &
  fi
}

# ===== 禁止 KWallet 启动 ===== 
# 杀死可能已经启动的 KWallet
killall kwalletd5 2>/dev/null
killall kwalletd6 2>/dev/null

# 禁止指定程序启动的函数
function block {
  killall "$1" 2>/dev/null
  # 创建一个假的可执行文件（占位符）
  # 如果有其他进程尝试启动它，会失败
}

# ===== 系统初始化 =====
# 禁止 KWallet
block kwalletd5
block kwalletd6
# 阻止 KWallet 启动（设置环境变量）
export KDE_WALLET_DISABLED=1

#run "dex $HOME/.config/autostart/arcolinux-welcome-app.desktop"

# Load Xresources
#echo "Xft.dpi: 138" | xrdb -merge
# Load Mouse settings, details in ~/.xprofile
xrdb -merge ~/.Xresources

######## My default monitor setting Start ########

~/.dwm/fix-monitors.sh

######## My default monitor setting End ########

#run "xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal"
#run "xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off"
#run xrandr --output eDP-1 --primary --mode 1368x768 --pos 0x0 --rotate normal --output DP-1 --off --output HDMI-1 --off --output DP-2 --off --output HDMI-2 --off
#run xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#run xrandr --output DVI-I-0 --right-of HDMI-0 --auto
#run xrandr --output DVI-1 --right-of DVI-0 --auto
#run xrandr --output DVI-D-1 --right-of DVI-I-1 --auto
#run xrandr --output HDMI2 --right-of HDMI1 --auto


# Set screen lock time
# xset s off 
# xset -dpms
# xset s noblank

xset s off
xset s noblank
xset +dpms         # 啟用電源管理功能
xset dpms 0 0 0    # 將 standby, suspend, off 的自動超時設為 0（即永不自動觸發）
#run "xautolock -time 60 -detectsleep -locker "slock" &"
#run "xset q | grep -q "DPMS is Enabled" && xset dpms 0 0 0"

#applications

#run "cmst --minimized"
#run "variety"
#run "pamac-tray"
#run "/usr/bin/octopi-notifier"
#run "bauh --tray"
run "pasystray &"
#run "blueman-applet &"
#run "xfce4-power-manager"
#run "blueberry-tray"
#run "/usr/lib/xfce4/notifyd/xfce4-notifyd"
#run "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1"
run "numlockx"

#picom -b  --config ~/.config/arco-dwm/picom.conf &

#run volumeicon
run fcitx5
run slstatus &
#sxhkd -c ~/.dwm/sxhkdrc & # Change to use ~/.config/autostart/ folder and .xprofile to start some apps
#run "nitrogen --restore"
#run "conky -c $HOME/.config/arco-dwm/system-overview"
#you can set wallpapers in themes as well
feh --bg-fill /home/userName/Pictures/xxx.jpg &
#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
#run applications from startup

#run "insync start"
#run "spotify"
#run "ckb-next -b"
#run "discord"
#run "telegram-desktop"

#run "xset dpms 0 0 3600"
#run "xset s 3600"
#run "xset s on"
#run "xset -dpms"
#run "xset s noblank"
