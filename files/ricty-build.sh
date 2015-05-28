#!/bin/sh -eu

# Clone Ricty
clone_ricty () {
    git clone --depth 1 https://github.com/yascentur/Ricty.git
}

if [ ${1:-''} = 'build' ]; then
    shift

    # Download fonts
    wget "http://levien.com/type/myfonts/Inconsolata.otf"
    wget -O migu-1m.zip "http://iij.dl.sourceforge.jp/mix-mplus-ipa/59022/migu-1m-20130617.zip"
    unzip -j migu-1m.zip

    # Generate Ricty
    clone_ricty
    ./Ricty/ricty_generator.sh $@ auto

    # Move font files
    mv Ricty*.ttf fonts/
elif [ ${1:-''} = 'help' ]; then
    clone_ricty
    exec ./Ricty/ricty_generator.sh -h
else
    exec $@
fi
