
dj() {
    command=$1
    shift

    # if virtualenv is active set working directory to project root otherwise use current working direcotry
    if [[ $VIRTUAL_ENV ]]; then
        cdproject > /dev/null
    fi

    case "$command" in
       "mkm") # makemigrations
            python manage.py makemigrations $@
            ;;
        "m") # migrate
            python manage.py migrate $@
            ;;
        "spm") # show pending migrations
            python manage.py showmigrations --plan | grep -v '[X]'
            ;;
        "sm") # show migrations
            python manage.py showmigrations --plan $@
            ;;
        "r") # runserver
            python manage.py runserver $@
            ;;
        *) # normal python manage.py usage
            python manage.py $command $@
            ;;
    esac

    # if virtualenv is active we have to go back to previous working directory
    if [[ $VIRTUAL_ENV ]]; then
        cd - > /dev/null
    fi
}
