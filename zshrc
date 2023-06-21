setopt PROMPT_SUBST

source ~/.shell/sh/alias.sh
source ~/.shell/sh/color.sh
source ~/.shell/sh/text.sh
source ~/.shell/sh/git-prompt.sh

source ~/.shell/zsh/history.sh
source ~/.shell/zsh/autosuggestions.zsh
source ~/.shell/zsh/git-completion.zsh

PROMPT='${NEWLINE}%B%*%b | %F{green}%n@%m%f | %B%~%b | $(git_prompt)${NEWLINE}%% '
