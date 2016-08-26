#!/bin/bash

# From Ugo

## Print nickname for git/hg/bzr/svn version control in CWD
## Optional $1 of format string for printf, default "(%s) "
function vcs_get_branch {
  local dir="$PWD"
  local vcs
  local nick
  while [[ "$dir" != "/" ]]; do
    for vcs in git hg svn bzr; do
      if [[ -d "$dir/.$vcs" ]] && hash "$vcs" &>/dev/null; then
        case "$vcs" in
          git)
              if type __git_ps1 1>/dev/null 2>&1; then
                __git_ps1 "${1:-(%s) }"
                return
              else
                nick=$(git branch 2>/dev/null | sed -e 's/^\* //')
              fi
              ;;
          hg) nick=$(hg branch 2>/dev/null);;
          svn) nick=$(svn info 2>/dev/null\
                | grep -e '^Repository Root:'\
                | sed -e 's#.*/##');;
          bzr)
            local conf="${dir}/.bzr/branch/branch.conf" # normal branch
            [[ -f "$conf" ]] && nick=$(grep -E '^nickname =' "$conf" | cut -d' ' -f 3)
            conf="${dir}/.bzr/branch/location" # colo/lightweight branch
            [[ -z "$nick" ]] && [[ -f "$conf" ]] && nick="$(basename "$(< $conf)")"
            [[ -z "$nick" ]] && nick="$(basename "$(readlink -f "$dir")")";;
        esac
        [[ -n "$nick" ]] && printf "${1:-(%s) }" "$nick"
        return 0
      fi
    done
    dir="$(dirname "$dir")"
  done
}
 
## Add branch to PS1 (based on $PS1 or $1), formatted as $2
export GIT_PS1_SHOWDIRTYSTATE=yes

