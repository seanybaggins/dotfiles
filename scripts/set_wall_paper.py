#!/usr/bin/python3
import glob
import random
import os

wallpaper_dir = "/home/sean/.config/wallpapers/"
set_wallpaper_command = "feh --bg-center"

def set_random_wallpaper(wallpapers):
    random.seed()
    random_index = random.randrange(0, len(wallpapers))
    wallpaper = wallpapers[random_index]
    os.system(set_wallpaper_command + " "+ wallpaper)

wallpapers = glob.glob(wallpaper_dir + "*jpg")
set_random_wallpaper(wallpapers)

