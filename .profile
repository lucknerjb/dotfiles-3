# Amar Paul's .profile
# using this for sourcing external scripts, exports, PATH changes

# Keep path fixes here: source from .bashrc or .zshrc separately

####
## PATH changes
####

# use this to fix if the path gets weird?
#DEFAULT_PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"

# homebrew changes
[[ $(uname) == 'Darwin' ]] && \
[[ -n $DEFAULT_PATH ]] && \
	export PATH="/usr/local/sbin:/usr/local/bin:$DEFAULT_PATH" && \
	unset DEFAULT_PATH || \
	export PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# my changes
export PATH="/opt/bin:$PATH"

# add pip installs (user)
export PATH="$PATH:/Users/paula1/Library/Python/3.6/bin"

# add fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Add cargo (Rust) stuff
[[ -d $HOME/.cargo/bin ]] && export PATH="$HOME/.cargo/bin:$PATH"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -d $HOME/.rvm/bin ]] && export PATH="$PATH:$HOME/.rvm/bin"

# keep this?
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 

####
## interpreter stuff
####

# Python shell tab completion (use homebrew python)
which python3 >/dev/null && export PYTHONSTARTUP="$(`which python3` -m jedi repl)"

# Use fuck/thefuck for command correction
which thefuck >/dev/null && eval $(thefuck --alias)


# comment out the rest of this, but keep it around?
: << 'END'

# old path/dyld/etc stuff (from .bash_profile)
####
# PATH and DYLD stuff go here for launchctl stuff (and other things probably)
# PATH and DYLD exports (lots of fixes)

# Uncomment to use GNU utils without g prefix
# PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
# MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# Virtualenv/VirtualenvWrapper
[[ -r /usr/local/bin/virtualenvwrapper.sh ]] && . /usr/local/bin/virtualenvwrapper.sh

# OpenCV 3.1.0 Support (Installed view homebrew, bound to Python 2.7)
if [[ -d /usr/local/Cellar/opencv3 ]]; then
    export DYLD_FALLBACK_LIBRARY_PATH=/usr/local/Cellar/opencv3/3.1.0/lib:$DYLD_FALLBACK_LIBRARY_PATH 
    export PYTHONPATH=/usr/local/Cellar/opencv3/3.1.0/lib/python2.7/site-packages:$PYTHONPATH
fi

# For using matplotlib instide virtualenv
# Inside (env), run: $ frameworkpython
function frameworkpython {
    if [[ ! -z "$VIRTUAL_ENV" ]]; then
        PYTHONHOME=$VIRTUAL_ENV /usr/local/bin/python "$@"
    else
        /usr/local/bin/python "$@"
    fi
}

# path for adb (Android Studio 1.0.xx)
if [[ -d $HOME/Library/Android/sdk/platform-tools ]]; then
  export PATH="$PATH:""$HOME/Library/Android/sdk/platform-tools"
fi

# Geant/Root stuff (can we brew install them?)
if [[ -d /Users/Amar/Desktop/Projects/Coutu && 0 -eq 1 ]]; then
  # Path modifications for Geant4
  export G4INSTALL='/Users/Amar/Desktop/Projects/Coutu/geant4.10.2-install'
  source $G4INSTALL/bin/geant4.sh

  # Path modifications for Root
  export ROOT='/Users/Amar/Desktop/Projects/Coutu/root'
  export PATH=$PATH:"/Users/Amar/Desktop/Projects/Coutu/root/bin"
  export LD_LIBRARY_PATH="/Users/Amar/Desktop/Projects/Coutu/root/lib"
  source /Users/Amar/Desktop/Projects/Coutu/root/bin/thisroot.sh
fi

# Ubertooth stuff
# Paths for Ubertooth One dynamic libs (libbtbb and libubertooth)
if [[ -d /Users/Amar/Ubertooth && 0 -eq 1 ]]; then
    export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/Amar/Ubertooth/libbtbb-2015-10-R1/build/lib/src
    export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:/Users/Amar/Ubertooth/ubertooth-2015-10-R1/host/build/libubertooth/src
fi

END
