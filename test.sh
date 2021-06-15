#!/usr/bin/env bash

echo -n "Give me a option! "

read Option

case $Option in
  1)
    echo "Checking if dir exists and creating it"

    echo -n "where do you want to have Directory created?   "
    read $MainDir

    if [[ ! -d $MainDir ]]; then
      echo "$MainDir doesn't exists, creating"
      mkdir $MainDir
      else
        echo " already there"
    fi
    ;;
  2)
    echo "Do something."
    ;;
  3)
    exit
    ;;
  *)
    echo "Not a known option"
    ;;
esac
