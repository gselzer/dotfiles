test "$DEBUG" && echo "[dotfiles] Loading plugin 'commands'..."

# --== myrepos ==--

alias mr='mr --stats'

# --== xterm ==--

alias xterm='xterm -geometry 80x60 -fg white -bg black'

# --== bat ==--

test -x /usr/bin/batcat && alias bat=batcat

# --== 7z ==--

# "7-zip compress" -- solid mode -- https://stackoverflow.com/a/52771612
alias 7zc='7za a -t7z -m0=lzma2 -mx=9 -mfb=273 -md=29 -ms=8g -mmt=off -mmtf=off -mqs=on -bt -bb3'

# --== shell ==--

alias mv='mv -i'
# NB: To get clear on Cygwin, install ncurses.
alias cls='clear;pwd;ls'
alias cdiff='colordiff 2> /dev/null'
alias grep='grep --color=auto'
alias cgrep='grep --color=always'
alias rgrep='grep -IR --exclude="*\.svn*"'
alias f='find . -name'

# --== version reporting ==--

# report details of the OS using 'version'
version() {
	test -x "$(which sw_vers 2> /dev/null)" && sw_vers
	test -e /proc/version && cat /proc/version
	test -x "$(which lsb_release 2> /dev/null)" && lsb_release -a
	test -e /etc/redhat-release && cat /etc/redhat-release
	test -x "$(which ver 2> /dev/null)" && ver
}

# --== history ==--

alias histime='HISTTIMEFORMAT="%F %T " history'

# --== eject ==--

if [ -x "$(which diskutil 2> /dev/null)" ]; then
  alias eject='diskutil eject'
fi

# --== ldd ==--

if [ ! -x "$(which ldd 2> /dev/null)" ]; then
	# make 'ldd' work on OS X
	alias ldd='otool -L'
fi

# --== hex editor ==--

# open a graphical hex editor using 'hex'
if [ -x "$(which ghex2 2> /dev/null)" ]; then
	alias hex='ghex2'
elif [ -d '/Applications/Hex Fiend.app' ]; then
	alias hex="'/Applications/Hex Fiend.app/Contents/MacOS/Hex Fiend'"
fi

# --== tab removal ==--

# remove tabs from files using 'detab'
alias detab="sedi -e 's/	/  /g'"

# --== gravatars ==--

gravhash() {
	php -r "echo md5(strtolower(trim('$@'))) . \"\n\";"
}
