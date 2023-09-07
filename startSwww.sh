#!/bin/sh

# This allows you to control which image to init the daemon with according
# to the time of day. You may change the match cases as you see fit.
# This currently only takes hours into account, but it should be easy to
# modify to also use minutes, or days of the week, if you want.
#
# Use it simply by calling this script instead of swww init

case $(date +%H) in
	00 | 01 | 02 | 03 | 04 | 05)  # 0:00 - 6:00

		swww init && swww img $HOME/.wallpapers/island_morning.jpg
		;;
	06 | 07 | 08 | 09 | 10 | 11) # 6:00 - 12:00
		
		swww init && swww img $HOME/.wallpapers/island_day.jpg
		;;
	12 | 13 | 14 | 15 | 16 | 17) # 12:00 - 18:00
		
		swww init && swww img $HOME/.wallpapers/island_evening.jpg
		;;
	18 | 19 | 20 | 21 | 22 | 23) # 18:00 - 0:00
		
		swww init && swww img $HOME/.wallpapers/island_night.jpg
		;;
esac
