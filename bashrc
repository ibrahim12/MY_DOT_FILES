# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias gitcb='git branch | grep "*"'
alias cclip='xclip -selection clipboard'
alias clipp='xclip -selection clipboard -o'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
#if ! shopt -oq posix; then

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# export JAVA_HOME=/home/ibrahim/app/jdk1.8.0_45
# export PATH=$PATH:$JAVA_HOME/bin

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

RING_SERVER_HOME="/home/ibrahim/work/UDPServer"
LOAD_BALANCER_HOME="/home/ibrahim/work/LoadbalancerForUDPServer"

LOAD_BALANCER="ant -f $LOAD_BALANCER_HOME/ -Dnb.internal.action.name=run run"
RING_SERVER="ant -f $RING_SERVER_HOME/ -Dnb.internal.action.name=run run"

ring_server(){
	$RING_SERVER
}

ring_build(){
	
	CURRENT_DIR=$(pwd)	
    
    echo "REBUILD UDPSERVER"
	cd $RING_SERVER_HOME
	ant -f . -Dnb.internal.action.name=rebuild clean jar
    
    echo "REBUILD LOAD BALANCER" 
    cd $LOAD_BALANCER_HOME
	ant -f . -Dnb.internal.action.name=rebuild clean jar
}


ring_l(){
    $LOAD_BALANCER
}


# ~/.bashrc: executed by bash(1) for non-login shells.

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

### Find a file in current path recrusively

iFind(){
    CURRENT_DIR=${pwd}    
    FILE_EXT=$1
    SEARCH_KEY=$2

    find ./ -type f -name "*.$FILE_EXT" -exec grep -Hn $SEARCH_KEY {} \;
}



















