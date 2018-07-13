_dj_completion() {
    if [[ $VIRTUAL_ENV ]]; then
        cdproject > /dev/null
    fi
    cur="${COMP_WORDS[COMP_CWORD]}"
    scripts=$( find . -wholename "*/commands/*.py" | sed -e 's!^.*/!!' -e 's!\..*$!!' | command grep "${cur}" )
    django_commands="check compilemessages createcachetable dbshell diffsettings dumpdata flush inspectdb loaddata
                     makemessages makemigrations migrate raven sendtestemail shell showmigrations sqlflush
                     sqlmigrate sqlsequencereset squashmigrations startapp startproject test testserver"
    command_complete=$(compgen -W "${django_commands}" -- ${cur})
    COMPREPLY=( ${scripts} ${command_complete} )
    if [[ $VIRTUAL_ENV ]]; then
        cd - > /dev/null
    fi
}

complete -F _dj_completion dj