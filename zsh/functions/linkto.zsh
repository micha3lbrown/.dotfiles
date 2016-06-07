linkto () {
    local repo=$(basename $(git rev-parse --show-toplevel))
    (
        cd $(dirname $*)
        local urlpath=$(find $(pwd) -name $(basename $*) | sed -n -e "s/^.*${repo}//p")
        local url="https://github.com/spreedly/${repo}/blob/master${urlpath}"
        echo $url | pb | cat -
    )
}

