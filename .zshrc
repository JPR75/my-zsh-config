# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
setopt appendhistory extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/JPR75/.zshrc'

autoload -Uz compinit
compinit

alias ls='ls --color=auto --group-directories-first'
alias ll='ls -lh --color=auto --group-directories-first'
alias la='ls -a --color=auto --group-directories-first'
LS_COLORS='no=00:di=33;01:tw=33;01:ow=33;01'
LS_COLORS=$LS_COLORS':fi=00:ln=00:pi=00:so=00:bd=00:cd=00:or=00:mi=00:ex=00'
LS_COLORS=$LS_COLORS':*.sh=31:*.sh=35:*.exe=31:*.bat=31:*.com=31'
LS_COLORS=$LS_COLORS':*.zip=36:*.tar=36'
export LS_COLORS

autoload -U colors && colors
autoload -U promptinit
promptinit

autoload -Uz vcs_info
#zstyle ':vcs_info:*' stagedstr 'Staged'
#zstyle ':vcs_info:*' unstagedstr 'Unstaged'
zstyle ':vcs_info:git*' formats "%{$fg_bold[blue]%}[%s] %{$fg_bold[green]%}(%b)%{$reset_color%} %{$fg[red]%}%u %{$fg[yellow]%}%c"
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' enable git
precmd() {
  vcs_info

  local STATUS="`git status 2>&1`"
  if [[ "$STATUS" == *'Not a git repository'* ]] then
    GITINFO=""
  else
    GITINFO="------ ${vcs_info_msg_0_}"$'\n'
  fi
}
setopt prompt_subst

export PS1=$'\n'"%{$fg[green]%}"-----------------------------------------------------------------------$'\n''${GITINFO}'"%{$fg[green]%}""------ [%~] %*"$'\n'-----------------------------------------------------------------------"%{$reset_color%}"$'\n\n\n'"%{$fg_bold[green]%}%n@%m:%#%{$reset_color%} "

# End of lines added by compinstall
