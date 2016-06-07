pb () {
    # example 'pb  # paste'
    # example 'echo hi | pb  # copy'
    # example 'echo hi | pb | cat -  # copy and paste'
    # example 'pb </tmp/file  # copy'
    # example 'pb >/tmp/file  # paste'
    # example 'pb </tmp/file1 >/tmp/file2  # copy and paste'

    if [[ -p /dev/stdin ]]
    then
        pbcopy
    fi
    if [[ ! -t 0 && ! -p /dev/stdin ]]
    then
        pbcopy
    fi
    if [[ -t 1 ]]
    then
        if [[ -t 0 ]]
        then
            pbpaste
        fi
    fi
    if [[ -p /dev/stdout ]]
    then
        pbpaste
    fi
    if [[ ! -t 1 && ! -p /dev/stdout ]]
    then
        pbpaste
    fi
}
