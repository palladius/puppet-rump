#!/bin/sh

set -e

git pull origin master &&                                  
make &&
rump go -vd &&
echo OK rump go ||
echo ERR rump go ret=$?

