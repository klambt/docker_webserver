#!/bin/bash
user="$1"
filename="$2"

if sudo -u ${user} -r ${filename}; then
  echo "Alright man..." >&2
else
  echo "Yuck! Where is it??" >&2
  exit 1
fi

sudo -u $1 test -x /etc/passwd; echo $?