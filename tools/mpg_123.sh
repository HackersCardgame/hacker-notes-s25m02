#! /bin/bash

#find /media/marc/77*/Music.merged/ -name "*3D0c*" -type f -print0 | shuf -z | xargs -0  mpg123  

#find /media/marc/771a9f36-8da1-4138-97c2-ec12ed9ef476/Music.merged/Faun/ -name "*a*" -type f -print0 | shuf -z | xargs -0  mpg123  



#find /media/marc/77*/Music.merged/ -name "*cl*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 
find /media/marc/77*/Music.merged/ -name "*282*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 
#find /media/marc/77*/Music.merged/ -name "*282*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 
#find /media/marc/77*/Music.merged/ -name "*inse*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 
#find /media/marc/77*/Music.merged/ -name "*es*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 

#find /media/marc/77*/Music.merged/ -name "*20.03.2021*" -type f -print0 | shuf -z | xargs -0  mpg123 -v -k 159000  

#find /media/marc/77*/Music.merged/ -name "*Zonne*" -type f -print0 | shuf -z | xargs -0  mpg123 -v 
#find /media/marc/77*/Music.merged/ -name "*Finger*" -type d -print0 -exec ls | shuf -z | xargs -0  mpg123 -v 
#find /media/marc/77*/Music.merged/ -name "*Finger*" -type d -print0 -exec find '{}'  -print0 \; | shuf -z | xargs -0  mpg123 -v 





#for i in $(seq 1 1000); do mpg123 -v -k 1901 -n 3200   /media/marc/771a9f36-8da1-4138-97c2-ec12ed9ef476/Music.merged/Sister\ Bliss/Headliners_02\ \[Disc\ 2\]/2-03\ Synergy.mp3; done
#for i in $(seq 1 1000); do mpg123 -v /media/marc/771a9f36-8da1-4138-97c2-ec12ed9ef476/Music.merged/Sister\ Bliss/Headliners_02\ \[Disc\ 2\]/2-03\ Synergy.mp3; done
