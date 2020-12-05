git_prompt() {
  inside_git_repo=$(git status -sb 2>/dev/null)

  if [ "$inside_git_repo" ]; then
    DEFAULT_COLOR="\033[0m"
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    ORANGE="\033[0;33m"

    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)

    branchName=$(git branch --show-current)

    aheadCount=$(git status -sb | grep -o "ahead [0-9]*" | grep -o "[0-9]*$")
    ahead=
    if [[ "$aheadCount" -gt 0 ]]; then
      ahead="${DEFAULT_COLOR}↑${aheadCount}"
    fi

    behindCount=$(git status -sb | grep -o "behind [0-9]*" | grep -o "[0-9]*$")
    behind=
    if [[ "$behindCount" -gt 0 ]]; then
      behind="${DEFAULT_COLOR}↓${behindCount}"
    fi

    if [ -z "$(git status -sb)" ]; then
      echo "${ORANGE}[${branchName}${ahead}${behind} ${GREEN}${BOLD}✔${NORMAL}${ORANGE}]${DEFAULT_COLOR}"
    else
      untrackedFilesCount=$(git status -sb | grep -c "??")
      untrackedFiles=
      if [ "$untrackedFilesCount" -gt 0 ]; then
        untrackedFiles=" ${RED}…?"
      fi

      notStagedFilesCount=$(git status -sb | grep -Ec '^(.M|.A|.R|.C|.D)')
      notStagedFiles=
      if [[ "$notStagedFilesCount" -gt 0 ]]; then
        notStagedFiles=" ${RED}●$notStagedFilesCount"
      fi

      stagedFilesCount=$(git status -sb | grep -Ec '^(M|A|R|C|D)')
      stagedFiles=
      if [[ "$stagedFilesCount" -gt 0 ]]; then
        stagedFiles=" ${GREEN}●$stagedFilesCount"
      fi

      conflictedFilesCount=$(git status -sb | grep -Ec "^(DD|AU|UD|UA|DU|AA|UU)")
      conflictedFiles=
      if [[ "$conflictedFilesCount" -gt 0 ]]; then
        conflictedFiles=" ${RED}${BOLD}$conflictedFilesCount Conflicted!${NORMAL}"
      fi

      echo "${ORANGE}[${branchName}${ahead}${behind}${conflictedFiles}${stagedFiles}${notStagedFiles}${untrackedFiles}${ORANGE}] ${DEFAULT_COLOR}"
    fi
  fi
}
