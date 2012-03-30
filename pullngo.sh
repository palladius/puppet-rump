#!/bin/sh

set -e

git pull origin master &&                                  
git submodule foreach git pull origin master &&           
rump go -vd &&
echo OK rump go ||
echo ERR rump go ret=$?

