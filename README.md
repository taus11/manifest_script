# functions
These are the work-simplifying scripts that I create and keep improving which keeps improving


NOTE: Do not use brackets, it skips important stuff if you want to filter out package-extra and package-python, you can do 'package-extra|python' after first argument. Add do you want to see an example function of cat with file.pnq sample file

# Tasks to do:
-. variable for home directory
-. make manifest proper executable
-. math for fullscreen == start ==
-. why using -E ?
-. Fix unary operator expected error
-. Stack exchange : How can I turn unheadlined groups to headlined
-. ↴ add this to manifest function, and learn about gitignore
-. fix bash: [: -zi: unary operator expected
-. If we simply ignore containers directory:
-. Separator in first filter

INSTRUCTIONS TO INSTALL :
Write your home directory
example

$chmod +x file.sh

copy this script to one of your path

3. Add this file to startup applications :-

Go to  System > Preferences > Startup Applications

Click on add  and in command write-
1

bash path/to/your/file.sh

Close and its done!

Next time when you start your system, all the tasks mentioned in the script will be automated.

Hope this helped!


write source /usr/local/bin/manifest.sh

restart terminal


If you want to avoid restarting terminal,
just do source manifest.sh



EXAMPLES:

1. $ manifest_search poppler 'rubygem|sharp|zathura|compat|poppler-data|python|pypoppler'


====================== START =========================
bash: [: -zi: unary operator expected

2nd Filter
Amazon/AMI/enterprise_linux:6/poppler-0.12.4-3.el6_0.1
Amazon/AMI/enterprise_linux:6/poppler-utils-0.12.4-3.el6_0.1

fedora:28/mingw-poppler-0.62.0-2.fc28
fedora:28/poppler-0.62.0-10.fc28

fedora:29/mingw-poppler-0.67.0-2.fc29
fedora:29/poppler-0.67.0-6.fc29

enterprise_linux:5:u9:server/poppler-0.5.4-19.el5
enterprise_linux:5:u11:server/poppler-0.5.4-19.el5_9.2
enterprise_linux:6:u4/poppler-0.12.4-3.el6_0.1
enterprise_linux:6:u5/poppler-0.12.4-3.el6_0.1
enterprise_linux:6:u6/poppler-0.12.4-3.el6_0.1
enterprise_linux:6:u7/poppler-0.12.4-4.el6_6.1
enterprise_linux:6:u10/poppler-0.12.4-12.el6_9
enterprise_linux:7:u2/poppler-0.26.5-5.el7
enterprise_linux:7:u3/poppler-0.26.5-16.el7
enterprise_linux:7:u4/poppler-0.26.5-16.el7
enterprise_linux:7:u5/poppler-0.26.5-17.el7_4
enterprise_linux:7:u6/poppler-0.26.5-20.el7

upcoming:enterprise_linux:8.0:appstream/poppler-0.66.0-10.el8
upcoming:enterprise_linux:8.0:buildroot/poppler-0.66.0-11.el8


====================== END =========================
