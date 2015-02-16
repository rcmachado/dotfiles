#
# Shell Aliases
#

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        2>&1 echo "ERROR: scp: missing colon";
    fi
}

# Build a gitignore file for project
# See https://www.gitignore.io/
function gitignore() {
    curl --location --show-error --silent "https://www.gitignore.io/api/$@";
}
