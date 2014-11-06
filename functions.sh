#
# Shell Aliases
#

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        echo "You forgot the colon";
    fi
}

# Build a gitignore file for project
# See https://www.gitignore.io/
function gi() {
    curl -L -s "https://www.gitignore.io/api/$@";
}
