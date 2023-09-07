eww="eww"
lockfile="$HOME/.cache/eww/locks/topbar.lock"

if [ -e $lockfile ]; then
	$($eww update expandbar=false)
	sleep 0.55
	$($eww close topbar)
	rm $lockfile
else
	$($eww open topbar)
	$($eww update expandbar=true)
	touch $lockfile
fi
