#!/bin/bash

declare -i rev

for ((rev = 1; rev < 100; ++rev))
do
    hash=$(git svn find-rev "r$rev")
    if [ -z $hash ]; then
        break
    fi
    if ((rev < 10));then
        tag="svn_r0$rev"
    else
        tag="svn_r$rev"
    fi
    git tag -a -m "$tag" $tag $hash
done
