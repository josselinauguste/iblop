#! /bin/sh

if [[ $(git status -s) ]]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old publication"
/bin/rm -rf docs/* 

echo "Generating site"
hugo

echo "Publishing to website"
git add --all && git commit -m "Publish content (publish.sh)" && git push origin
