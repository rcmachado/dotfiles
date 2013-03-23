#!/bin/bash
#
# Install all the dotfiles on system (using symlinks)
#

INSTALL_DIR="$HOME"

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Just in case
mkdir -p "$INSTALL_DIR"

# Adapted from https://github.com/mikemcquaid/dotfiles/blob/master/install-dotfiles.sh
for DOTFILE in *; do
    HOMEFILE="$INSTALL_DIR/.$DOTFILE"
    [ -d $DOTFILE ] && DOTFILE="$DOTFILE/"
    DIRFILE="$DIR/$DOTFILE"

    echo $DOTFILE | egrep -q '(dotfiles|\.txt|\.md)' && continue

    #echo $DOTFILE | grep -q '\.sh' \
    #    && HOMEFILE="$INSTALL_DIR/.$(echo $DOTFILE | sed -e 's/\.sh//')"

    if [ -L "$HOMEFILE" ] && ! [ -d $DOTFILE ]
    then
        ln -sfv "$DIRFILE" "$HOMEFILE"
    else
        rm -rfv "$HOMEFILE"
        ln -sv "$DIRFILE" "$HOMEFILE"
    fi
done

"$DIR/install-gitignore.sh" "$INSTALL_DIR/"
