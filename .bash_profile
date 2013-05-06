for z in /usr/local/bin/zsh
do
    if [ -x $z ]
    then
        exec $z -l
    fi
done
