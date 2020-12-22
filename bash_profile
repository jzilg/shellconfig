. ~/.shell/sh/alias.sh
. ~/.shell/sh/color.sh
. ~/.shell/sh/text.sh
. ~/.shell/sh/history.sh
. ~/.shell/sh/git-prompt.sh

. ~/.shell/bash/git-flow-completion.bash
. ~/.shell/bash/npm-completion.bash
. ~/.shell/bash/window.bash
. /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

export PS1="$NEWLINE$BOLD$WHITE\t$NORMAL | $GREEN\u@\h $WHITE| $BOLD\w$NORMAL | \`git_prompt\` $NEWLINE$ ";
