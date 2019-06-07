manifest_dir=/home/msiddiqu/git/gitlab/manifests/*
containers_dir=/home/msiddiqu/git/gitlab/manifests/containers

#NOTE: Please use full path name and not ~ for your home dir because it matches the output that has full path.

function manifest_search {

    COLUMNS=$(tput cols)
    start=$(echo -e "\e[1m           ----START OF MANIFEST SEARCH----\e[0m")
    red=$(tput setaf 1)
    printf "%*s\n" $(((${#start}+$COLUMNS)/2)) "${red}$start"

    if [ -z "$1" ]; then
        printf "\n\033[1;31m Please Provide An Argument\033[0m\n"
    fi

    if [ $# == 1 ]; then
          printf "\n\033[1;31m1st Filter ↓ \033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir
    fi
    #

    if [ $# == 2 ]; then
          printf "\n\033[1;31m2nd Filter ↓\033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir | egrep -Evi -e "$2" | uniq --group -w 9 | egrep -zi "$1"
    fi

    if [ $# == 3 ]; then
          printf "\n\033[1;31m3rd Filter ↓\033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir | egrep -Evi -e "$2" | egrep -Evi -e "$3" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 4 ]; then
          printf "\n\033[1;31m4th Filter ↓\033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 5 ]; then
          printf "\n\033[1;31m5th Filter ↓ \033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | uniq --group -w 9 | egrep -zi "$1"

    fi

    if [ $# == 6 ]; then
          printf "\n\033[1;31m6th Filter ↓, till here I'm letting it supported in this script \033[0m\n"
          egrep --exclude-dir=$containers_dir --exclude='manifest-eol.txt' -r -h -i -e "$1" $manifest_dir | egrep -Evi -e "$2" | egrep -Evi -e "$3" | egrep -Evi -e "$4" | egrep -Evi -e "$5" | egrep -Evi -e "$6" | uniq --group -w 9 | egrep -zi "$1"

    fi

    echo
    COLUMNS=$(tput cols)
    end=$(echo -e "\e[1m           -----END OF MANIFEST SEARCH-----\e[0m")
    red=$(tput setaf 1)
    printf "%*s\n" $(((${#end}+$COLUMNS)/2)) "${red}$end"

}
