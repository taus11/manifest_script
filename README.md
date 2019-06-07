![black](https://user-images.githubusercontent.com/32044701/59132991-3f334300-8994-11e9-8782-c7c0eaecb020.jpg)

README:

Put this line in your ~/.bashrc : source ~/git/github/manifest_script/manifest.sh

You can simply write
$ manifest_search wireshark separate
This will group and separate affects in terms of different products.


EXAMPLES:
```
EXAMPLE 0 (Because arrays start at 0): Cat and dogs!

Statement: I want to see both kernel-rt and kernel-alt

Command:
$manifest_search
```
EXAMPLE 1 :

Statement: I want to see both kernel-rt and kernel-alt

$manifest_search 'kernel-alt|kernel-rt'

**Screenshot**


TODO:
- upload it to PS tools git repo
- Email to incoming.
- Screenshot examples.
    echo
    echo "NOTE: Do not use brackets, it skips important stuff if you want to filter out package-extra and package-python, you can do 'package-extra|python' after first argument.

     Add do you want to see an example function of cat with file.pnq sample file"

    echo ; echo "Make a practice to search:" ; echo "$ manifest_search '""/gd ""' first, to find out packages like 'gd (in php)'" ;

    echo ; echo "Also Make a practice to search:" ; echo "$ manifest_search '""solr[0-9]""' first, to find out packages like 'solr3' package"

***

These are the work-simplifying scripts that I create and keep improving which keeps improving


NOTE: Do not use brackets, it skips important stuff if you want to filter out package-extra and package-python, you can do 'package-extra|python' after first argument. Add do you want to see an example function of cat with file.pnq sample file

# Tasks to do:
-. echo issue: in last Source the shell file if the search term isn't getting highlighted
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
-. You may modify this script to run git pull --rebase to always update the manifest repo before running the search function.
-. Optimise for packages like python : http://localhost:5600/static/#/flaw/1631420
-.    automatically do this in first filter :  echo ; echo "Make a practice to search:" ; echo "$ manifest_search '""/gd ""' first, to find out packages like 'gd (in php)'" ;
-. Source it before you run or grep wont highlight the search keyword :(

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



EXAMPLES IN RED after the script runs:

$ manifest_search '/glib-[0-9]|/glib[0-9]-|mingw-glib-[0-9]|/mingw-glib[0-9]'  separate

Use the keyword separate to view a grouped easy on the eyes affects

is the same as

$ manifest_search glib 'glibc|glibd|json|networking|dbus|json|tag|libvirt|libgit|geocode|libappstream|glibmm|cglib|telepathy|perl|snapd|ghc|python|libac|libgs|template|signon|pcre|rubygem|rust|java|spglib|alglib|codeready'


1. $ manifest_search poppler 'rubygem|sharp|zathura|compat|poppler-data|python|pypoppler'


====================== START =========================

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


How to use:

manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'

manifest_search term1(what you want to have) term2(what you dont want to have)

make sure you don't do term1 term1. term1-term2










ADD THIS TO README

<Tausif> lpardo, psampaio|AFK I get this output

manifest_search  'php-[0-9]|rh-php[0-9][0-9]-php' 'pear|pecl|codeready|dropbox|ring|captcha|less|mod|kdevelop|zipstream|jmespath|zxcvbn|scss|xmp'

wish I could show this result on my terminal where those PScomponents are highlighted. you can further | grep rhscl these to show all kinds of php stuff only for rhscl. So we don't really need a separate manifest. but we dont need to do that since psmodules like rhscl are already grouped and separated
<Tausif> the script is a lil embarrasing now. But I will refine it and we all can try that in our next meeting.

manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'

<Tausif> http://pastebin.test.redhat.com/767323 : This is what I do for kernel, which gets me kernel-5, kernel-rt, kernel-alt so that nothing is missed
<Tausif> lpardo, ^^


send this to thoger also as a reply to his mail Subject: [psr] Missing or incorrect flaw affects entries  

Ask me: Hey I want to see these packages, I'll quickly form a command, and you'l quickly learn it.

DO NOT Commit
