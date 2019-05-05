1.) cat testFile.txt | sed -n 's/chevy/chevy/p'> ostaluis.txt
2.) cat testFile.txt | sed -n  '3,6p' >> ostaluis.txt
3.) cat testFile.txt | sed -n -e '/chevy/,/bmw/p' >> ostaluis.txt
4.) cat testFile.txt | sed -e 's/chevy/Chevrolet/g' >> ostaluis.txt
5.) cat testFile.txt | sed 's/$/\n--------------------/' >> ostaluis.txt
6.) cat testFile.txt | sed -e '/^ford/d' >> ostaluis.txt
7.)
8.) cat testFile.txt | awk '{ print $5,$1 }' >> ostaluis.txt
9.) cat testFile.txt | awk '{count[$1]++} END {print count["ford"]}' >> ostaluis.txt
10.)