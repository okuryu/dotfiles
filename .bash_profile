for z in /bin/zsh /usr/local/bin/zsh
do
    if [ -x $z ]
    then
        exec $z -l
    fi
done
