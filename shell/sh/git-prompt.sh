#!/bin/sh

git_prompt() {
  insideGitRepo="$(git status 2>/dev/null)"

  if [ "$insideGitRepo" ]; then
    DEFAULT_COLOR="\033[0m"
    RED="\033[0;31m"
    GREEN="\033[0;32m"
    ORANGE="\033[0;33m"

    BOLD=$(tput bold)
    NORMAL=$(tput sgr0)

    gitStatus=$(git status -sb)
    branchName=$(git branch --show-current)

    if [[ -n "$(git status | grep "^rebase in progress")" ]]; then
      branchName="${RED}${BOLD}Rebasing →"
    fi

    if [ -n "$(git stash list)" ]; then
        stashedFiles=" ${DEFAULT_COLOR}*"
    fi

    aheadCount=$(echo "$gitStatus" | grep -o "ahead [0-9]*" | grep -o "[0-9]*$")
    ahead=
    if [[ "$aheadCount" -gt 0 ]]; then
      ahead="${DEFAULT_COLOR}↑${aheadCount}"
    fi

    behindCount=$(echo "$gitStatus" | grep -o "behind [0-9]*" | grep -o "[0-9]*$")
    behind=
    if [[ "$behindCount" -gt 0 ]]; then
      behind="${DEFAULT_COLOR}↓${behindCount}"
    fi

    if [ "$(echo "$gitStatus" | wc -l | xargs)" -eq 1 ]; then
      echo "${ORANGE}[${branchName}${ahead}${behind} ${GREEN}${BOLD}✔${NORMAL}${stashedFiles}${ORANGE}]${DEFAULT_COLOR}"
    else
      untrackedFilesCount=$(echo "$gitStatus" | grep -c "??")
      untrackedFiles=
      if [ "$untrackedFilesCount" -gt 0 ]; then
        untrackedFiles=" ${RED}…?"
      fi

      notStagedFilesCount=$(echo "$gitStatus" | grep -Ec '^(.M|.A|.R|.C|.D)')
      notStagedFiles=
      if [[ "$notStagedFilesCount" -gt 0 ]]; then
        notStagedFiles=" ${RED}●$notStagedFilesCount"
      fi

      stagedFilesCount=$(echo "$gitStatus" | grep -Ec '^(M|A|R|C|D)')
      stagedFiles=
      if [[ "$stagedFilesCount" -gt 0 ]]; then
        stagedFiles=" ${GREEN}●$stagedFilesCount"
      fi

      conflictedFilesCount=$(echo "$gitStatus" | grep -Ec "^(DD|AU|UD|UA|DU|AA|UU)")
      conflictedFiles=
      if [[ "$conflictedFilesCount" -gt 0 ]]; then
        conflictedFiles=" ${RED}${BOLD}$conflictedFilesCount Conflicted!${NORMAL}"
      fi

      echo "${ORANGE}[${branchName}${ahead}${behind}${conflictedFiles}${stagedFiles}${notStagedFiles}${untrackedFiles}${stashedFiles}${ORANGE}]${DEFAULT_COLOR}"
    fi
  fi
}
