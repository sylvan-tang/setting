#!/usr/bin/env bash

file_name=$1

charset_name=`file -I ${file_name} | awk '{print $3}' | cut -d '=' -f2`

echo "$file_name: charset=$charset_name"

if [[ "${charset_name}" = "iso-8859-1" ]]
then
    iconv -f GB18030 -t utf-8 ${file_name} > tmp
fi

mv tmp ${file_name}

file -I ${file_name}