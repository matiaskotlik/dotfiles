
alias clear="echo '---CLEARED---'; printf '\33[H\33[2J'"
alias c='clear'

function extract() {
    if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
        echo "       extract <path/file_name_1.ext> [path/file_name_2.ext] [path/file_name_3.ext]"
        return 1
    else
        for n in $@; do
            if [ -f "$n" ]; then
                case "${n%,}" in
                *.tar.bz2 | *.tar.gz | *.tar.xz | *.tbz2 | *.tgz | *.txz | *.tar)
                    tar xvf "$n"
                    ;;
                *.lzma) unlzma ./"$n" ;;
                *.bz2) bunzip2 ./"$n" ;;
                *.rar) unrar x -ad ./"$n" ;;
                *.gz) gunzip ./"$n" ;;
                *.zip) unzip ./"$n" ;;
                *.z) uncompress ./"$n" ;;
                *.7z | *.arj | *.cab | *.chm | *.deb | *.dmg | *.iso | *.lzh | *.msi | *.rpm | *.udf | *.wim | *.xar)
                    7z x ./"$n"
                    ;;
                *.xz) xz -dv ./"$n" ;;
                *.exe) cabextract ./"$n" ;;
                *)
                    echo "extract: '$n' - unknown archive method"
                    return 1
                    ;;
                esac
            else
                echo "'$n' - file does not exist"
                return 1
            fi
        done
    fi
}

function add_submodules() {
    root_path=$(pwd)
    for submodule in $(find -mindepth 2 -type d -name .git); do
        submodule_dir=$root_path/$submodule/..
        remote_name=$(cd $submodule_dir && git rev-parse --abbrev-ref --symbolic-full-name @{u} | cut -d'/' -f1)
        remote_uri=$(cd $submodule_dir && git remote get-url $remote_name)

        echo "Adding $submodule with remote $remote_name..."

        # If already added to index, but not to .gitmodules...
        git rm --cached $submodule_dir &>/dev/null

        git submodule add "$@" $remote_uri $submodule_dir
    done
}

function cdls() {
    cd "$1" && ls
}

alias cperf='sudo cpupower frequency-set -u 3.5G -g performance; sudo boost on'
alias cpower='sudo cpupower frequency-set -u 2G -g powersave; sudo boost off'

alias unmount='umount'

alias h='history'

alias moveup='find . -mindepth 1 -maxdepth 1 -exec mv -t .. -- {} +'
alias flatten='find . -mindepth 2 -type f -exec "mv ./ {} -t . -b +"'

alias wget='wget -c'

alias exiftool='exiftool -s -G'

alias funmount='fusermount -uz'
alias fumount='fusermount -uz'

alias https='http --default-scheme=https'
alias rc='http --json --print Bb'

alias open='xdg-open'
alias rmlink='unlink'
alias rmln='unlink'

alias ranger='. ranger'

alias zenith='zenith --disable-history'

alias internalip="ip addr | grep -oP '(?<=inet ).*(?=/\\d?\\d? brd)'"
alias localip="internalip"

alias hs='h | grep '

alias ncfg="nvim $XDG_CONFIG_HOME/nvim/init.vim"
alias lc='exa --icons --classify --header --git'
alias ll='lc -laa'
alias la='lc -aa'
alias tree='lc --tree'

function clc() {
  cd "$1" && lc "${@:2}"
}
function cll() {
  cd "$1" && ll "${@:2}"
}
function cla() {
  cd "$1" && la "${@:2}"
}

function cls() {
    cd "$1" && ls "${@:2}"
}

alias matrix='cmatrix'

alias xpaste='xclip -selection c -o'
alias xcopy='xclip -selection c'

alias killlol='pkill -9 wine'

alias dragon=dragon-drag-and-drop

alias aspd='aria2c -x 16 -s 16'

alias listen='pactl load-module module-loopback latency_msec=1'
alias stoplisten='pactl unload-module module-loopback'

alias pm='yay'
alias gdb='gdb --quiet'
alias sync-dotfiles='yadm add -u && yadm commit -m "Sync dotfiles" && yadm push'

if [[ "$TERM" == "xterm-kitty" ]]; then
    alias icat="kitty +kitten icat"
    alias kdiff="kitty +kitten diff"
fi

if [[ "$ZSH_VERSION" ]]; then
    alias -g L='| less'

    hash -d data="$DATA"
    hash -d prog="$DATA/programming"
    hash -d downloads="$DATA/downloads"
    hash -d iso="$DATA/iso"
    hash -d docs="$DATA/documents"
    hash -d documents="$DATA/documents"
    hash -d movies="$DATA/movies"
    hash -d tv="$DATA/tv"
    hash -d videos="$DATA/videos"
    hash -d pics="$DATA/pictures"
    hash -d pictures="$DATA/pictures"
    hash -d remotes="$HOME/remotes"
    hash -d desktop="$HOME/desktop"
    hash -d music="$DATA/music"
    hash -d games="$DATA/games"
    hash -d bin="$HOME/bin"
    hash -d wg="$HOME/wireguard"
    hash -d git="$DATA/programming/git"
    hash -d aur="$DATA/programming/aur"
    hash -d hacking="$DATA/programming/hacking"
    hash -d misc="$DATA/programming/misc"
    hash -d dotfiles="$HOME/dotfiles"
    hash -d public="$DATA/public"
    hash -d private="$DATA/private"

    function fh() {
        local match
        # remove numbers from history
        match="$(awk '!seen[$0]++' < $HISTFILE | fzf +m --reverse --tac -q "$LBUFFER")"
        [[ "$?" == "130" ]] && return # if fzf failed then don't do anything else
        match="${match#*[0-9]*  }" # remove up to first double space
        LBUFFER="$match"
    }
    zle -N fh

    # bind control n to search history
    bindkey -v '^n' fh
    bindkey -a '^n' fh
fi

alias kill-detached='tmux list-sessions | grep -v attached | cut -d: -f1 |  xargs -t -n1 tmux kill-session -t'
