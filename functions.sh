#
# Shell Aliases
#

# Check if we forget the colon on scp
function scp() {
    if [[ "$@" =~ : ]]; then
        /usr/bin/scp $@;
    else
        echo "You forgot the colon dumbass!";
    fi
}
