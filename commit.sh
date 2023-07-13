#!/bin/sh
 
NEW_NAME="sangheon"
NEW_EMAIL="sanghun0724@naver.com"
export GIT_COMMITTER_NAME="$NEW_NAME"
export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
export GIT_AUTHOR_NAME="$NEW_NAME"
export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
 
git commit
