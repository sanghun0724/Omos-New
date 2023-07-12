#!/bin/sh
 
NEW_NAME="testtest"
NEW_EMAIL="testtest@testmail.com"
export GIT_COMMITTER_NAME="$NEW_NAME"
export GIT_COMMITTER_EMAIL="$NEW_EMAIL"
export GIT_AUTHOR_NAME="$NEW_NAME"
export GIT_AUTHOR_EMAIL="$NEW_EMAIL"
 
git commit
