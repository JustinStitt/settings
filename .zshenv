# for ranger (limit to one nested instance of ranger file manager, also put 'exit' after bash -c zsh in .bashrc)
ra() {
    if [ -z "$RANGER_LEVEL" ]
    then
        ranger
    else
        exit
    fi
}
