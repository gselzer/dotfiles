# Git - https://github.com/git/git
export CODE_GIT="$CODE_BASE/git/git"
alias gogit='cd $CODE_GIT'

# --== shortcuts =-

# These complement the ones defined by oh-my-zsh's git plugin.

alias conflicts!='git diff --name-only --diff-filter=U --no-prefix'
alias conflicts='git diff --name-only --diff-filter=U'
alias gbv='git branch -avv'
alias gcpo='git cherry-pick --strategy=recursive --strategy-option=ours'
alias gcpt='git cherry-pick --strategy=recursive --strategy-option=theirs'
alias gd!='git diff --no-prefix'
alias gdbl='git diff-blame'
alias gdcw!='git diff --color-words --no-prefix'
alias gdcw.!='git diff --color-words --word-diff-regex=. --no-prefix'
alias gdcw.='git diff --color-words --word-diff-regex=.'
alias gdcw='git diff --color-words'
alias gdfo='git diff-tree --no-commit-id --name-only -r'
alias gds!='git diff --staged --no-prefix'
alias gdscw!='git diff --staged --color-words --no-prefix'
alias gdscw.!='git diff --staged --color-words --word-diff-regex=. --no-prefix'
alias gdscw.='git diff --staged --color-words --word-diff-regex=.'
alias gdscw='git diff --staged --color-words'
alias gfat='gfa && git fetch --all --tags'
alias gfb='git filter-branch -f --prune-empty'
alias gfbi='git filter-branch -f --prune-empty --index-filter'
alias gfbs='git filter-branch -f --prune-empty --subdirectory-filter'
alias gfbt='git filter-branch -f --prune-empty --tree-filter'
alias gff='git merge --ff --ff-only '\''HEAD@{u}'\'
alias gffs='git stash && gff && git pop'
alias glns='git log --name-status'
alias glnsf='git log --name-status --follow'
alias gls='git ls-files'
alias gmv='git mv'
alias gpack='git reset --hard && git for-each-ref --format='\''%(refname)'\'' refs/original/ | xargs -n 1 git update-ref -d && git reflog expire --expire=now --all && git gc --aggressive --prune=now'
alias gpop!='git checkout '\''stash^{tree}'\'' -- . && git stash drop'
alias gpop='git stash pop --index'
alias gps='fix-git-remotes && gp'
alias grhup='git reset --hard '\''HEAD@{u}'\'
alias grup!='grup --prune'
alias gsh!='gsh --no-prefix'
alias gshcw!='gsh --color-words --no-prefix'
alias gshcw.!='gsh --color-words --word-diff-regex=. --no-prefix'
alias gshcw.='gsh --color-words --word-diff-regex=.'
alias gshcw='gsh --color-words'
alias gtags='git fetch --tags && git tag -l --sort=taggerdate'
alias gum='git cherry -v master'
alias gws='git rebase --whitespace=strip'
alias wikiclone='clone -c '\''remote.origin.mediaimport=true'\'' -c '\''remote.origin.mediaexport=true'\'' -c '\''remote.origin.namespaces=(Main) File Template'\'
gh() {
  alias | grep git | grep "$@"
  for cmd in $(declare -f | grep '^[a-z]\+ () {$' | sed 's/^\([a-z]*\).*/\1/')
  do
    func=$(which "$cmd")
    echo "$func" | grep -q git &&
    echo "$func" | grep -q "$@" &&
    echo "$func" | grep -C9999 "$@"
  done
}
ghr() {
  local slug=$1
  test "$slug" || slug=$(git remote -v | cut -d"$(echo "\t")" -f2 | head -n1 | sed 's/.*github.com\/\([^ ]*\).*/\1/')
  test "$slug" &&
  git remote set-url origin "git://github.com/$slug" && git remote set-url --push origin "git@github.com:$slug"
}
gll() {
  local num=$(echo "$1" | sed 's/[^0-9]//g')
  shift
  test "$num" || num=1
  glgp -$num $@
}
gri() {
  local ref=''
  case $# in
    0)
      # If nothing is given, rebase against upstream.
      ref='HEAD@{u}'
      shift
      ;;
    1)
      # If a number is given, rebase that many commits back.
      if test echo "$1" | grep -q '[^0-9]'; then ref="HEAD~$1"; shift; fi
      ;;
  esac
  test "$ref" && grbi "$ref" $@ || git rgbi $@
}
gtagsv() {
  gtags | while read tag
  do
    echo "$(git rev-parse "$tag")\t$tag"
  done
  for remote in $(git remote)
  do
    echo "[$remote]" && git ls-remote $remote | grep '/tags/'
  done
}
#TODO: make this more visible. Something interactive, maybe, where we show
# the files that would be added, and then ask for confirmation. Thus the
# command is not blind.
gak() {
  git add $({git ls-files --others --exclude-standard; git diff --name-only} | grep $@)
}

# --== git-svn ==--

# tell git-svn where to find SVN authors
export SVN_AUTHORS="$CODE_CFG_PRIVATE/authors.txt"

# --== Git-Mediawiki (https://github.com/moy/Git-Mediawiki/wiki) ==--

# Install prerequisites:
# cpan MediaWiki::API
# cpan DateTime::Format::ISO8601

# Put git-remote-mediawiki and git-mw somewhere on your PATH:
# ln -s "$CODE_GIT/contrib/mw-to-git/git-remote-mediawiki.perl" \
#       ~/bin/git-remote-mediawiki
# ln -s "$CODE_GIT/contrib/mw-to-git/git-mw" ~/bin

export PERL5LIB="$CODE_GIT/perl:$CODE_GIT/contrib/mw-to-git"
