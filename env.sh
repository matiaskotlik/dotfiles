export DATA="$HOME/data"
export ANDROID_EMULATOR_HOME="$DATA/android"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export XDG_CONFIG_HOME="$HOME/.config"
export SDKMAN_DIR="$DATA/sdkman"
export XDG_CACHE_HOME="$DATA/cache"
export SDKMAN_DIR="$DATA/sdkman"
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORMTHEME=qt5ct
export VISUAL=nvim
export EDITOR=nvim
export PAGER=less
export SUDO_ASKPASS="$HOME/bin/zenity-askpass"
export LESSHISTFILE="$XDG_CACHE_HOME/less-history"
export HISTSIZE=99999 
export GNUPGHOME="$XDG_CACHE_HOME/gnupg/"
export TERMINAL=alacritty
export BROWSER=google-chrome-stable
export GAMEMODERUNEXEC='prime-run'
export CARGO_HOME="$DATA/cargo"
export RUSTUP_HOME="$DATA/rustup"
export GOPATH="$DATA/go"
export GOBIN="$GOPATH/bin"
export GRADLE_USER_HOME="$HOME/.local/gradle"

pathprepend() {
  for ARG in "$@"; do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="$ARG${PATH:+":$PATH"}"
    fi
  done
}

pathappend() {
  for ARG in "$@"; do
    if [ -d "$ARG" ] && [[ ":$PATH:" != *":$ARG:"* ]]; then
        PATH="${PATH:+"$PATH:"}$ARG"
    fi
  done
}

pathprepend $CARGO_HOME/bin 
pathappend ~/bin ~/.local/bin $GOBIN ~/.npm/bin ~/flutter/bin ~/jetbrains/idea/bin
