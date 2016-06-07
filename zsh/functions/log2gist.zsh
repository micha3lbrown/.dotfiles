log2gist () {
        local log=$1
        gist -a -p -d"$(basename $log | sed -e's/_/ /g' -e 's/\..*$//')" -f output.sh -c -s $log
        if [ $? -eq 0 ] && confirm "Remove $log?"
        then
                rm $log
        fi
}
