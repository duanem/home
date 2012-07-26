#!/bin/sh
if [ -f "$1" ] && [ -f "$2" ]; then
        bbdiff "${1}" "${2}"
fi
exit 0
