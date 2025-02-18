for i in *.webp; do ffprobe -v error -select_streams v:0 show_entries stream=nb frames -of default=noprint_wrappers=1:nokey=1 "$i" | grep -q '^1$' && ffmpeg -i "$i" -q:v 90 "${i%.webp}.jpg" || ffmpeg -i "$i" "${i%.webp}.gif"; done

