export DATA="$HOME"
[[ "$HOST" == "matias-pc" ]] && export DATA="$HOME/data"
export ANDROID_HOME="$DATA/android"
export ANDROID_SDK_ROOT="$ANDROID_HOME"
export ANDROID_EMULATOR_HOME="$DATA/android/emulator"
export XDG_CONFIG_HOME="$HOME/.config"
export CHROME_EXECUTABLE="/usr/bin/google-chrome-stable"
export SDKMAN_DIR="$DATA/sdkman"
export XDG_CACHE_HOME="$DATA/.cache"
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
export BROWSER=firefox
export GAMEMODERUNEXEC='prime-run'
export CARGO_HOME="$DATA/cargo"
export RUSTUP_HOME="$DATA/rustup"
export GOPATH="$DATA/go"
export GOBIN="$GOPATH/bin"
export GRADLE_USER_HOME="$HOME/.local/gradle"

pathmunge() {
  if ! echo "$PATH" | /bin/grep -Eq "(^|:)$1($|:)" ; then
    if [ "$2" = "after" ] ; then
      PATH="$PATH:$1"
    else
      PATH="$1:$PATH"
    fi
  fi
}

pathmunge "$CARGO_HOME/bin"
pathmunge ~/bin
pathmunge ~/.local/bin
pathmunge "$GOBIN"
pathmunge ~/.npm/bin
pathmunge ~/flutter/bin
pathmunge "$ANDROID_HOME/platform-tools"
