
txt () {
#    author 'Erich Smith'
#    about 'send text to SMS env var'
#    param 'message to send'
#    example 'SMS=9195551212 txt some message here'
#    group 'shell'
    if [ -n "$SMS" ]
    then
        curl http://textbelt.com/text -d number=$SMS -d "message=${*}" > /dev/null 2>&1
    fi
}
