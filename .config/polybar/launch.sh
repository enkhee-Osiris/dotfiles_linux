# Terminate already running instances
killall -q polybar

# Wait until the processes have been shutdown
while pgrep -u $UID -x polybar > /dev/null; do sleep 1; done

polybar dark -r
