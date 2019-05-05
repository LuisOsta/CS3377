#!/bin/bash
totalDirs=0
read -p 'Enter Directory Path: ' baseDirectory
eval cd $baseDirectory
for f in ./*; do
    if [ -d "$f" ]; then
        totalDirs=$((totalDirs + 1))
    fi
done
echo $totalDirs