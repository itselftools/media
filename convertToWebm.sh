for i in ./social/vi/*.mp4; 
do
    echo "${i%.mp4}"
    ffmpeg -i "$i" -vf scale=495:278 -c:v libvpx-vp9 -crf 40 -b:v 0 -b:a 128k -c:a libopus "${i%.mp4}.webm"
done
