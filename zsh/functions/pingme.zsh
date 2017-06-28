pingme () {
#    about 'Notifies you when a host is pingable'
#    param '1: ip or fqdn to ping'
#    example 'pingme 8.8.8.8'
#    example 'pingme some.host.com'
#    example 'SMS=9195551212 pingme ssh host.com'
#    group 'network'
    typeset cmd
    if [ "$1" = "ssh" ]
    then
        cmd="ssh -o BatchMode=yes -o StrictHostKeyChecking=no -o ConnectTimeout=5 $2 whoami"
        shift
    else
        cmd="ping -c 1 -t 1 $1"
    fi
    echo "using cmd: $cmd"
    echo -n "waiting for host $1"
    while ! eval $cmd > /dev/null 2>&1
    do
        echo -n '.'
        sleep 1
    done
    echo 'ok'
    echo "$(date) pingme: $1 is up" >> ~/output.log
    say "$1 is up"
    [ -n "$SMS" ] && txt $1 is up
}
