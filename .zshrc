PROMPT="%B%F{6}[%n%F{14}@%f%F{6}%m%F{9} %c%F{6}]%F{9}$%f %b"

source /home/lucas/.zsh_aliases

HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory

# Language
export LANG=pt_BR.UTF-8

# Tab completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)

# Tab completion case insensitive
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 

# Bindings for "Home", "End", etc. keys.

bindkey "^[[H"  	beginning-of-line
bindkey "^[[F"  	end-of-line
bindkey "^[[4~" 	end-of-line
bindkey "^[[1;3D"	backward-word
bindkey "^[[1;3C"	forward-word
bindkey "^[[P"		delete-char

# Editor Padrão
export VISUAL=nvim
export EDITOR=nvim

setxkbmap br
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# Normal bindkeys (not vi)
# bindkey -e

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/lucas/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
#
function yank (){
    cat $1 | xsel -b
}
