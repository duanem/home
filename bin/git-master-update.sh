#! /bin/bash

# set -o xtrace
set -o errexit

PROGNAME=$(basename $0)

Usage()
{
    cat <<eof 1>&2
Usage: $PROGNAME [-b|--branch branch] [-v|--verbose]

Update branch for all of the repos. Branch defaults to master.

Assumes that the repo branches have already been created.
eof
exit 2
}

SHORTOPTS="hb:v"
LONGOPTS="help,branch:,verbose"
ARGS=$(getopt -s bash --options $SHORTOPTS --longoptions $LONGOPTS --name $PROGNAME -- "$@")
optres=$?

REPOS=(dbcorr mgt sts vis)
branch=master
VERBOSE=0

eval set -- "$ARGS"
while [ ! -z "$1" ]
do
    case "$1" in
        -h|--help)
            Usage
            ;;
        -b|--branch)
            branch="$2"
            shift
            ;;
        -v|--verbose)
            VERBOSE=1
            ;;
        --)
            shift
            break
            ;;
        -*)
            Usage
            ;;
    esac
    shift
done

for repo in "${REPOS[@]}"
do
    if [[ $VERBOSE != 0 ]]
    then
        echo "Updating repo $repo"
    fi
    git fetch $repo
    git checkout $repo.$branch
    git pull
done

