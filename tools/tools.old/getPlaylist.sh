#!bin/bash

sudo apt-get install pipx

pipx install yt-dlp -U

~/.local/bin/yt-dlp --extract-audio --audio-format mp3 -c --yes-playlist -w 10 $1
