alias gl='glg $(git show-ref | cut -d " " -f 2 | grep -v stash$) HEAD'
alias gls='gl --simplify-by-decoration'

alias glw='glp --word-diff'
alias gsw='git show --format=fuller'
alias gco='git checkout'
alias gcp='git checkout -p'
alias gs='git status --untracked-files=all'
alias gst='git stash --include-untracked --keep-index'
alias gstp='git stash pop'
alias gss='git stash show -p'
alias grl='git reflog --pretty=format:"%Cred%h%Creset %C(auto)%gd%Creset %C(auto)%gs%C(reset) %C(green)(%cr)%C(reset) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gsl='git stash list --pretty=format:"%C(red)%h%C(reset) - %C(dim yellow)(%C(bold magenta)%gd%C(dim yellow))%C(reset) %<(70,trunc)%s %C(green)(%cr) %C(bold blue)<%an>%C(reset)"'
alias gd='git diff -M40'
alias gdw='gd --word-diff=color --word-diff-regex="[A-z0-9_-]+"'
alias gbdw='gbd --word-diff=color --word-diff-regex="[A-z0-9_-]+"'
alias gds='gd --cached'
alias gdsw='gdw --cached'
alias gbd='_git_assert_origin_head && gd $(git merge-base origin/HEAD HEAD)..'
alias gbl='_git_assert_origin_head && git-log --reverse $(git merge-base origin/HEAD HEAD)..'
alias gblp='_git_assert_origin_head && glp $(git merge-base origin/HEAD HEAD)..'
alias gar='git reset HEAD'
alias garp='git reset -p HEAD'
alias ga='git add'
alias gap='git add -p'
alias gld="git fsck --lost-found | grep '^dangling commit' | cut -d ' ' -f 3- | xargs git show -s --format='%ct %H' | sort -nr | cut -d ' ' -f 2 | xargs git show --stat"
alias gc='git commit -v'
alias gcm='gc -m'
alias gcme='gc --edit -m'
alias gca='gc --amend'
alias grc='git rebase --continue'
alias gp='git push'
alias gpt='git push -u origin $(git_current_branch)'
alias gws='git wip save WIP --untracked'
alias gwd='git update-ref -d refs/wip/$(git_current_branch)'
alias gsp='git stash push'
alias gspop='git stash pop'
alias gu='gitui'

function gsh() {
  if [ -n "$1" ]
  then
    local offset="$1"
    shift
  else
    local offset="0"
  fi
  git show -p "stash@{$offset}" "$@"
}

function gshu() {
  if [ -n "$1" ]
  then
    local offset="$1"
    shift
  else
    local offset="0"
  fi
  git show -p "stash@{$offset}^3" "$@"
}

function gsk() {
  gitk --all --date-order $(git stash list | awk -F: '{print $1};')
}

# helper for git aliases
function git_current_branch()
{
  git symbolic-ref --short -q HEAD
}

function git_current_tracking()
{
  local BRANCH="$(git_current_branch)"
  local REMOTE="$(git config branch.$BRANCH.remote)"
  local MERGE="$(git config branch.$BRANCH.merge)"
  if [ -n "$REMOTE" -a -n "$MERGE" ]
  then
    echo "$REMOTE/$(echo "$MERGE" | sed 's#^refs/heads/##')"
  else
    echo "\"$BRANCH\" is not a tracking branch." >&2
    return 1
  fi
}

function _git_assert_origin_head() {
  if ! git rev-parse origin/HEAD &> /dev/null; then
    if git rev-parse origin/develop &> /dev/null; then
      local TARGET=develop
    else
      local TARGET=master
    fi

    echo fatal: origin/HEAD is not set. >&2
    echo >&2
    echo Maybe run \`git remote set-head origin $TARGET\`? >&2
    return 1
  fi
}

function git-log() {
  git log -M40 --pretty=format:'%Cred%h%Creset%C(yellow)%d%Creset %s %C(green bold)- %an %C(black bold)%cd (%cr)%Creset' --abbrev-commit --date=short "$@"
}

# git log
function glg() {
  if [[ $# == 0 ]] && git rev-parse @{u} &> /dev/null; then
    git-log --graph @{u} HEAD
  else
    git-log --graph "$@"
  fi
}

# git log patch
function glp()
{
  # don't use the pager if in word-diff mode
  local pager="$(echo "$*" | grep -q -- '--word-diff' && echo --no-pager)"

  # use reverse mode if we have a range
  local reverse="$(echo "$*" | grep -q '\.\.' && echo --reverse)"

  # if we have no non-option args then default to listing unpushed commits in reverse moode
  if ! (for ARG in "$@"; do echo "$ARG" | grep -v '^-'; done) | grep -q . && git_current_tracking > /dev/null 2>&1
  then
    local default_range="@{upstream}..HEAD"
    local reverse='--reverse'
  else
    local default_range=''
  fi

  git $pager log --patch -M40 $reverse "$@" $default_range
}

# git log file
function glf()
{
  git log -M40 --format=%H --follow -- "$@" | xargs --no-run-if-empty git show --stat
}

# git log search
function gls()
{
  local phrase="$1"
  shift
  if [[ $# == 0 ]]
  then
    local default_range=HEAD
  fi
  glp --pickaxe-all -S"$phrase" "$@" $default_range
}

# checkout a GitHub pull request as a local branch
function gpr()
{
  local TEMP_FILE="$(mktemp "${TMPDIR:-/tmp}/gpr.XXXXXX")"
  echo '+refs/pull/*/head:refs/remotes/origin/pr/*' > "$TEMP_FILE"
  git config --get-all remote.origin.fetch | grep -v 'refs/remotes/origin/pr/\*$' >> "$TEMP_FILE"
  git config --unset-all remote.origin.fetch
  cat "$TEMP_FILE" | while read LINE
  do
    git config --add remote.origin.fetch "$LINE"
  done
  rm "$TEMP_FILE"

  git fetch
  if [[ -n "$1" ]]; then
    git checkout "pr/$1"
  fi
}

function gup
{
  # subshell for `set -e` and `trap`
  (
    set -e # fail immediately if there's a problem

    # use `git-up` if installed
    if type git-up > /dev/null 2>&1
    then
      exec git-up
    fi

    # fetch upstream changes
    git fetch

    BRANCH=$(git symbolic-ref -q HEAD)
    BRANCH=${BRANCH##refs/heads/}
    BRANCH=${BRANCH:-HEAD}

    if [ -z "$(git config branch.$BRANCH.remote)" -o -z "$(git config branch.$BRANCH.merge)" ]
    then
      echo "\"$BRANCH\" is not a tracking branch." >&2
      exit 1
    fi

    # create a temp file for capturing command output
    TEMPFILE="`mktemp -t gup.XXXXXX`"
    trap '{ rm -f "$TEMPFILE"; }' EXIT

    # if we're behind upstream, we need to update
    if git status | grep "# Your branch" > "$TEMPFILE"
    then

      # extract tracking branch from message
      UPSTREAM=$(cat "$TEMPFILE" | cut -d "'" -f 2)
      if [ -z "$UPSTREAM" ]
      then
        echo Could not detect upstream branch >&2
        exit 1
      fi

      # can we fast-forward?
      CAN_FF=1
      grep -q "can be fast-forwarded" "$TEMPFILE" || CAN_FF=0

      # stash any uncommitted changes
      git stash | tee "$TEMPFILE"
      [ "${PIPESTATUS[0]}" -eq 0 ] || exit 1

      # take note if anything was stashed
      HAVE_STASH=0
      grep -q "No local changes" "$TEMPFILE" || HAVE_STASH=1

      if [ "$CAN_FF" -ne 0 ]
      then
        # if nothing has changed locally, just fast foward.
        git merge --ff "$UPSTREAM"
      else
        # rebase our changes on top of upstream, but keep any merges
        git rebase -p "$UPSTREAM"
      fi

      # restore any stashed changes
      if [ "$HAVE_STASH" -ne 0 ]
      then
        git stash pop
      fi

    fi

  )
}

gau() {
  git ls-files --other --exclude-standard -z "$@" | xargs -0 git add -Nv
}

gaur() {
  git ls-files --exclude-standard --modified -z | xargs -0 git ls-files --stage | while read MODE OBJECT STAGE NAME; do
    if [[ "$OBJECT" == e69de29bb2d1d6434b8b29ae775ad8c2e48c5391 ]]; then
      echo "reset '$NAME'"
      if git rev-parse --quiet --verify HEAD > /dev/null; then
        git reset -q -- "$NAME" 2>&1
      else
        git rm --cached --quiet -- "$NAME"
      fi
    fi
  done
}

gcf() {
  if [[ $# -gt 0 ]]; then
    git commit --fixup "$@"
    return
  fi

  if [[ $(git diff --staged --name-only | wc -l) -lt 1 ]]; then
    echo Nothing staged to commit. >&2
    return 1
  fi

  COMMITS="$(
    git diff --staged --name-only -z |
      xargs -0 git log --pretty=format:'%H %s' @{u}.. |
      awk '{ if ($2 != "fixup!") { print $1} }'
  )"

  case $(echo "$COMMITS" | grep . | wc -l | tr -d -c 0-9) in
    0)
      echo No fixup candidates found. >&2
      return 1
      ;;
    1)
      git commit --fixup "$COMMITS"
      ;;
    *)
      echo Staged files:
      git diff --staged --name-only | sed 's/^/  /'
      echo
      echo Multiple fixup candidates:
      echo "$COMMITS" | xargs git show -s --oneline | sed 's/^/  /'
      return 1
      ;;
  esac
}

grt() {
  if git rev-parse @{u} &> /dev/null; then
    local TARGET="@{u}"
  else
    _git_assert_origin_head
    local TARGET="origin/HEAD"
  fi

  git rebase -i $(git merge-base HEAD $TARGET)
}

grb() {
  _git_assert_origin_head
  git rebase -i $(git merge-base HEAD origin/HEAD)
}

stashgrep() {
  IFS=$'\n'
  for i in `git stash list --format="%gd"`; do
    git stash show -p $i | grep -H --label="$i" --color=always -C1 $@;
  done
}

gfix () {
  git stash -u -k
  git commit --fixup=$1
  git rebase --interactive --autosquash $1^
  git stash pop
}

# show last 20 branches
gbr () {
  git for-each-ref --sort=-committerdate --count=20 refs/heads/ --format='%(HEAD)%(align:right,2)%(upstream:trackshort)%(end) %(color:red)%(objectname:short)%(color:reset) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' "$@"
}
