#!/bin/bash

function tester_man {

    printf "\n\033[1;31m ====================== START =========================\033[0m\n"
    if [ -zi "$1" ]; then
        printf "\n\033[1;31m Please Provide Argument\033[0m\n"
    fi

    if [ $# == 1 ]; then
          printf "\n\033[1;31m 1st Filter \033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/*
    fi

    if [ $# == 2 ]; then
          printf "\n\033[1;31m 2nd Filter\033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/* | egrep -Evi -e "$2" | uniq --group -w 9 | egrep -zi "$1"
    fi

    if [ $# == 3 ]; then
          printf "\n\033[1;31m 3rd Filter\033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 4 ]; then
          printf "\n\033[1;31m 4th Filter\033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 5 ]; then
          printf "\n\033[1;31m 5th Filter \033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 6 ]; then
          printf "\n\033[1;31m 6th Filter, till here I'm letting it supported in this script \033[0m\n"
          egrep --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/prodsec/documentation/process-docs/manifest/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | egrep -Evi -e "$6" | uniq --group -w 9 | egrep -zi "$1"

    fi
    echo
    printf "\n\033[1;31m ====================== END =========================\033[0m\n"
    echo
    echo "NOTE: Do not use brackets, it skips important stuff if you want to filter out package-extra and package-python, you can do 'package-extra|python' after first argument. Add do you want to see an example function of cat with file.pnq sample file"

}
