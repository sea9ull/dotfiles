# CASE_SENSITIVE="true"
export GOPATH=$HOME/dev/go/bin:$HOME/dev/go/src/cli-kintone
export SWIFTPATH=$HOME/dev/swift/usr/bin
export RUBYPATH=$HOME/dev/ruby/.rbenv/bin:$HOME/dev/ruby/.rbenv/plugins/ruby-build/bin
export LD_LIBRARY_PATH=$HOME/dev/oracle/instantclient_12_1
export PATH=$PATH:$GOPATH:$SWIFTPATH:$RUBYPATH:$LD_LIBRARY_PATH

#Character code for Oracle instant client
export NLS_LANG=JAPANESE_JAPAN.AL32UTF8

eval "$(rbenv init -)"
# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

#=============================
# Alias
#=============================
#
if [ $SHLVL = 2 ]; then
  alias tmux="tmux attach || tmux new-session \; source-file ~/.tmux/new-session"
fi
alias oracle='sqlplus kintone/k@192.168.5.5:1521/GANSEN.DOMAIN'
alias killconky='killall conky'
alias vi='vim -u ~/.virc'
alias rouge='cocot -t UTF-8 -p EUC-JP -- jnethack'
alias irc='cocot -t UTF-8 -p ISO-2022-JP -- irssi'
alias chatwork='chatwork-irc -addr="127.0.0.1:6667"&'
alias mutt='mutt -n'
alias tmux='tmux -2'
#alias ruby='ruby2.0'
alias ls='ls -F --color=auto'
alias la='ls -a'
alias ll='ls -l'
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias sudo='sudo '
alias ...='cd ../..'
alias ....='cd ../../..'

alias -g L='| less'
alias -g G='| grep'

#Key Bind
#vim like keybind
bindkey -v

#autocomplete
autoload -U compinit; compinit
autoload -U promptinit; promptinit
zstyle ':completion:*default' menu select=1


WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

#=============================
# History
#=============================
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
#Ctrl+P, Ctrl+N compatible cmd list prev next
bindkey "^N" history-beginning-search-forward-end
bindkey "^P" history-beginning-search-backward-end

HISTFILE=$HOME/.zsh_history
HISTSIZE=60000
SAVEHIST=60000
HIST_STAMPS="yyyy/mm/dd"
setopt extended_history
setopt append_history

setopt share_history
setopt hist_ignore_all_dups #not add same history
setopt hist_ignore_dups     #if head char is space ,don't add history
setopt hist_ignore_space
setopt hist_reduce_blanks

#setopt hist_verify         #when select cmd in histry, stop edit cmd
setopt hist_save_no_dups    #no save same command
setopt hist_no_store        #history command don't regist
setopt list_packed



#=============================
# Option
#=============================
#show japanese filename
setopt print_eight_bit
setopt no_beep
setopt no_flow_control
#not exit zsh then Ctrl+D
setopt ignore_eof
setopt auto_cd
setopt magic_equal_subst


#use extended wildcard
setopt extended_glob

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#=============================
# Peco settings
#=============================
function peco_select_history() {
  if which peco &> /dev/null; then
    #Linux:tac, Unix/MacOSX:tail -r
    local tac
    if which tac &> /dev/null; then
      tac="tac"
    else
      tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | eval $tac | peco --query "$LBUFFER")
    #BUFFER=$(history -n 1 | eval $tac | peco --layout=bottom-up --query "$LBUFFER" )
    CURSOR=$#BUFFER
    zle -R -c
  else
    echo "peco not found"
  fi
}
zle -N peco_select_history

# keybind Ctrl+R
bindkey '^R' peco_select_history

#=============================
# Prompt
#=============================
# include color
autoload -Uz colors; colors
#0 black   #4 blue    #
#1 red     #5 magenta #
#2 green   #6 cyan    #
#3 yellow  #7 white   #

#◉❖ ❯⏺ •⚫ ⬟ ⬠ ⬡ ⬢ ⬣ ⬝  
#PROMPT='%F{0}%B%m%b%F{7}❯%F{6}❯%F{4}❯%f%B ~ $%b '
PROMPT='%B%F{3} %F{0}%m%F{4}⚫%b%F{6}⚫%F{4}⚫%f%B %~ $%b '
#PROMPT='%F{0}%B%m%b%F{7}⬢%F{6}⬢%F{4}⬢%f%B %~ $%b '
