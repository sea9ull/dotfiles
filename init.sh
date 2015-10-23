#!/bin/sh

for f in .??*
do
	[ "$f" = ".git" ] && continue
	ln -svfn "$HOME"/dotfiles/"$f" "$HOME"/"$f"
done
