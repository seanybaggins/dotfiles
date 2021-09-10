#!/bin/bash
WALLPAPERS=$(ls | grep "jpg")
echo "WALLPAPERS: $WALLPAPERS"
TOTAL_WALLPAPERS= $(echo $WALLPAPERS | count)
echo "TOTAL_WALLPAPERS: $TOTAL_WALLPAPERS"
wallpaper=$(wallpapers[$random % $TOTAL_WALLPAPERS])
echo "wallpaper: $wallpaper"


