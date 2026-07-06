#!/bin/sh

styles="app,APP,app_ fft,FFT,fft_ command,COMMAND, diag,DIAG,diag dump,DUMP,dump region,REGION,region solve,SOLVE,solve"
for stl in ${styles}
do
 IFS=',' read -r st1 st2 st3 <<< "$stl"
 fname="style_$st1.h"
 list=`grep -l "${st2}_CLASS" "$st3"*.h`
 echo "writing $fname"
 if [ -e "$fname" ]; then
  rm "$fname"
 fi
 for file in ${list}
 do
  echo "#include \"$file\"" >> "$fname"
 done
done

exit 0

