export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:/Users/timoxley/.cargo/bin

# Customize to your needs...
#::/usr/bin:/bin:/usr/sbin:/sbin
#export PATH=$PATH:/usr/local/share/npm/bin
#export PATH=$PATH:/opt/local/bin
#export PATH=$PATH:/opt/local/sbin

export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/X11/lib/pkgconfig
export NODE_ENV='development'
export ALGORAND_DATA="$HOME/algorand-node/data"

hitch() {
  command hitch "$@"
  if [[ -s "$HOME/.hitch_export_authors" ]] ; then source "$HOME/.hitch_export_authors" ; fi
}

# added by travis gem
[ -f /Users/timoxley/.travis/travis.sh ] && source /Users/timoxley/.travis/travis.sh

# locale stuff
export LANG=en_AU.UTF-8
export LC_CTYPE=en_US.UTF-8

# general shell settings
export FIGNORE="CVS:.DS_Store:.svn:__Alfresco.url"

export STREAMR_API_KEY="hI9RAYhdTCeexdEzRJki8gQNNwM4JuTDGIyBIizwoi-Q"

alias sdd='streamr-docker-dev'
[ -f /Users/timoxley/.sdkman/bin/sdkman-init.sh ] && source /Users/timoxley/.sdkman/bin/sdkman-init.sh
