g() {
    git $@
}
# make sure to point to valid git completion script
source /usr/local/etc/bash_completion.d/git-completion.bash
__git_complete g __git_main
