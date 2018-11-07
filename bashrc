
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'
alias http_server="python -m SimpleHTTPServer"

cjson(){
    echo "$1" | python -m json.tool | xclip -selection c
}

mjson(){
    echo "$1" | json-minify | xclip -selection c
}

mcjson(){
    json-minify "$1" | xclip -selection c
}

iFind(){
    CURRENT_DIR=${pwd}    
    FILE_EXT=$1
    SEARCH_KEY=$2

    find ./ -type f -name "*.$FILE_EXT" -exec grep -Hn $SEARCH_KEY {} \;

}

setxkbmap -layout us -option ctrl:nocaps

alias gcb="git branch | grep '*'"
alias glast="git for-each-ref --sort=committerdate refs/heads | tail"
alias glb="glast | awk '{print $3}' | cut -d/ -f3"
alias gcp="git rev-parse --abbrev-ref HEAD | tr -d '\n' | xclip -selection clipboard"
