# Enable terminal colors for the `ls` command
# CLICOLOR=1

# Sources (the order matters!)
source ~/.exports
source ~/.path
source ~/.functions
source ~/.aliases
source ~/.bash_prompt
source ~/.git-completion.bash # https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash

# Hostname & working directory on tab name (good for sshing)
# PROMPT_COMMAND='echo -ne "\033]0; ${HOSTNAME} ➝ ${PWD##*/} $(__git_ps1 "(%s)")\007"'

case $(uname) in
	'Darwin')
		PROMPT_COMMAND='echo -ne "\033]0; ${HOSTNAME} @ ${PWD##*/} $(__git_ps1) \007"'
	;;
	'Linux')
		PROMPT_COMMAND='echo -ne "\033]0; ${HOSTNAME} @ $(__git_ps1) \007"'
	;;
esac

# Enable alias g=git to auto-complete w/ branch names
complete -o default -o nospace -F _git g
complete -o default -o nospace -F _git_push ps # only completes 'origin'

# Increase maxfiles & maxproc
# ulimit -n 1024
# ulimit -u 1024
ulimit -S -n 2048


# Enables extended glob patterns
shopt -s extglob

# Disables clash of history with extended glob patterns commands
set +H