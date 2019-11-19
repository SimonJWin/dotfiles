alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Groom (Git RM) deleted files by staging their deletion
alias groom="git status | grep deleted | awk '{\$1=\$2=\"\"; print \$0}' | \
             perl -pe 's/^[ \t]*//' | sed 's/ /\\\\ /g' | xargs git rm"

# Use VIM's pager
alias lev=`find /usr/share/vim -name less.sh -print`

# This is how "ps" should look by default (on Linux machines).
alias pl='ps fax'

# use GNU ls and make sure in color.
alias ls='gls --color'
