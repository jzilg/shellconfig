zstyle ':completion:*:*:git:*' script ~/.zsh/zsh-git-completion/git-completion.bash
fpath=(~/.zsh $fpath)

autoload -Uz compinit && compinit
