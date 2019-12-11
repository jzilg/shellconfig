setopt PROMPT_SUBST

source ~/.shell/sh/alias.sh
source ~/.shell/sh/colors.sh
source ~/.shell/sh/history.sh

source ~/.shell/zsh/autosuggestions.zsh
source ~/.shell/zsh/git-prompt.zsh
source ~/.shell/zsh/git-completion.zsh

NEWLINE=$'\n'

PROMPT='${NEWLINE}%B%*%b | %F{green}%n@%m%f | %B%~%b | $(git_super_status)${NEWLINE}%% '
