ZSH_CUSTOMIZED="$HOME/.zsh"
fpath=( $ZSH_CUSTOMIZED $fpath )

autoload -U promptinit && promptinit
prompt pure

# Base16 Shell
BASE16_SHELL="$ZSH_CUSTOMIZED/base16-shell/base16-eighties.dark.sh"
[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL

source $ZSH_CUSTOMIZED/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ls
if which dircolors > /dev/null; then
  # GNU Core Utilities
  alias ls='ls --group-directories-first'

  if [[ -s "$HOME/.dir_colors" ]]; then
    eval "$(dircolors --sh "$HOME/.dir_colors")"
  else
    eval "$(dircolors --sh)"
  fi

  alias ls="$aliases[ls] --color=auto"
else
  # BSD Core Utilities
  # Define colors for BSD ls.
  export LSCOLORS='exfxcxdxbxGxDxabagacad'

  # Define colors for the completion system.
  export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:'

  alias ls='ls -G'
fi

# Customize to your needs...
export DEBFULLNAME="Hong Yifan (homer)"
export DEBEMAIL="hyfing@gmail.com"

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.bin" ] ; then
    PATH="$HOME/.bin:$PATH"
fi

# perl cpan
if [ -d "$HOME/.perl5" ] ; then
    [ $SHLVL -eq 1 ] && eval "$(perl -I$HOME/.perl5/lib/perl5 -Mlocal::lib=$HOME/.perl5)"
    alias perlmod="perl -M5.016 -MExtUtils::Installed -e '$,=\"\n\";' -e 'say ExtUtils::Installed->new()->modules();'"
fi

# rbenv setting
if [ -d "$HOME/.rbenv/bin" ] ; then
    PATH="$HOME/.rbenv/bin:$PATH"
fi

eval "$(rbenv init -)"

alias e="emacsclient -a '' -c"
alias m='wget -m -e robots=off -U "Mozilla/5.0 (Windows; U; Windows NT 5.1; zh-CN; rv:1.9.1.6) Gecko/20091201 Firefox/3.5.6" -c -t0 -k -p -np'
