#!/bin/bash

# NAME: build-complex-passwords.sh
# AUTHOR: Vagner Rodrigues Fernandes <vagner.rodrigues@gmail.com>
# DESCRIPTION: Script for build complex passwords
# USAGE: ./build-complex-passwords.sh keys-list complement-list
# MATCHCHARS: Character's for match password (keylist+complementlist) 

LISTFILE=$1
MATCHFILE=$2
MATCHCHARS=(\# \. \_ \*)

while IFS= read -r keyname
do

	while IFS= read -r matchname
	do
		echo "${keyname}${matchname}"
                echo "${matchname}${keyname}"

		for x in `echo ${!MATCHCHARS[*]}`; do
			echo "${keyname}${MATCHCHARS[$x]}${matchname}"
			echo "${matchname}${MATCHCHARS[$x]}${keyname}"
		done

	done < "$MATCHFILE"

done < "$LISTFILE"
