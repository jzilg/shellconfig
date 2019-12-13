source ~/.shell/zsh/zsh-git-prompt/zshrc.sh

ZSH_THEME_GIT_PROMPT_PREFIX="%F{yellow}[%f"
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{yellow}]%f"
ZSH_THEME_GIT_PROMPT_SEPARATOR=" "
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[red]…?%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{✚%G%}"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
