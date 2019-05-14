

# containers_dir = /home/msiddiqu/git/gitlab/manifests/containers/
# manifest_dir = /home/msiddiqu/git/gitlab/manifests/*
# This script's path to source = source ~/git/github/functions/manifest.sh
# Please use full path name and not ~ for your home dir. because it matches the output that has full path.

function manifest_search {

    printf "\n\033[1;31m ====================== START OF MANIFEST SEARCH v2 =========================\033[0m\n"
    if [ -z "$1" ]; then
        printf "\n\033[1;31m Please Provide An Argument\033[0m\n"
    fi

    if [ $# == 1 ]; then
          printf "\n\033[1;31m 1st Filter \033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/*
    fi
    #

    if [ $# == 2 ]; then
          printf "\n\033[1;31m 2nd Filter\033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/* | egrep -Evi -e "$2" | uniq --group -w 9 | egrep -zi "$1"
    fi

    if [ $# == 3 ]; then
          printf "\n\033[1;31m 3rd Filter\033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 4 ]; then
          printf "\n\033[1;31m 4th Filter\033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 5 ]; then
          printf "\n\033[1;31m 5th Filter \033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 6 ]; then
          printf "\n\033[1;31m 6th Filter, till here I'm letting it supported in this script \033[0m\n"
          egrep --exclude-dir=/home/msiddiqu/git/gitlab/manifests/containers --exclude='manifest-eol.txt' -r -h -i -e "$1" /home/msiddiqu/git/gitlab/manifests/* | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | egrep -Evi -e "$6" | uniq --group -w 9 | egrep -zi "$1"

    fi
    echo
    printf "\n\033[1;31m ====================== END OF MANIFEST SEARCH =========================\033[0m\n"
    echo
    echo "NOTE: Do not use brackets, it skips important stuff if you want to filter out package-extra and package-python, you can do 'package-extra|python' after first argument. Add do you want to see an example function of cat with file.pnq sample file"
    echo ; echo "Make a practice to search:" ; echo "$ manifest_search '""/gd ""' first, to find out packages like 'gd (in php)'" ;
    echo ; echo "Also Make a practice to search:" ; echo "$ manifest_search '""solr[0-9]""' first, to find out packages like 'solr3' package"

}
