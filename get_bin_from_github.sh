#!/bin/bash

list="sharkdp/bat sharkdp/fd chmln/sd theryangeary/choose"

mkdir tmp
cd tmp

for tool in $list;
do
    echo "start to download $tool"
    resp=`curl -s https://api.github.com/repos/$tool/releases/latest | jq -r '.assets[].browser_download_url' | grep -v "win" | grep -v "musl" | grep -v "arm"`
    declare -a url_list
    declare -i n=0
    for url in $resp;
    do
        url_list[$n]=$url
        n=$n+1
        echo "$n: $url"
    done
    declare -i u
    read -p "Please input your choice:" u
    echo "Download from: ${url_list[$u-1]}"
    #wget ${url_list[$u-1]}
done

cd ..
