#!/bin/bash

if [ "$1" = "push" ] ; then
	if ! git diff-index --quiet HEAD -- ; then
		echo "There are uncommited changes"
		git status
		exit 1
	fi
fi

git submodule init
git submodule update

SITE_REPO=_site_repo

if [ ! -d "$SITE_REPO" ] ; then
    git clone git@github.com:na4zagin3/na4zagin3.github.io.git "$SITE_REPO"
fi

if [ "$1" = "push" ] ; then
	( cd "$SITE_REPO" && git checkout -f master && git pull )
fi

stack build
stack exec na4zagin3-page clean
stack exec na4zagin3-page build

rsync -r --exclude ".git/" --delete _site/ "$SITE_REPO"
( cd "$SITE_REPO" && git status )

if [ "$1" = "push" ] ; then
	COMMIT_ID="$(git show -s --format=%H)"
	( cd "$SITE_REPO" && git checkout master && git add -A && git commit -m "Update ($COMMIT_ID)" && git push origin master )
fi
