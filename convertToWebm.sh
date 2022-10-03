
array=( ./social/vi/send-voice---fd509701 ./social/vi/send-voice---5f6f7e92 ./social/vi/send-voice---065c289e ./social/vi/send-voice---eb0c0733 )
for i in ./social/vi/*.mp4; 
do
  # echo "${i%.mp4}"
  if [[ "${array[*]}" =~ "${i%.mp4}" ]]; then
    echo "${i%.mp4}"
    ffmpeg -i "$i" -vf scale=495:278 -c:v libvpx-vp9 -crf 40 -b:v 0 -b:a 128k -c:a libopus "${i%.mp4}.webm"
  fi
done
