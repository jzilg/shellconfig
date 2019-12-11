. ~/.shell/sh/alias.sh
. ~/.shell/sh/color.sh
. ~/.shell/sh/history.sh

. ~/.shell/bash/color.bash
. ~/.shell/bash/git.bash
. ~/.shell/bash/git-flow-completion.bash
. ~/.shell/bash/npm-completion.bash
. ~/.shell/bash/window.bash
. /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash

export PS1="\n$bold$silver\t | $green\u@\h $silver$bold| \w \`parse_git_branch\` $reset \n$ ";
