# Instructions to install:
1. Clone this repo
2. Edit the manifest.sh file
  - Change just the two variables: `manifest_dir` and `containers_dir` in the manifest.sh  with the corresponding paths in your file system exactly as it is written there. I suggest using find and replace.
3. Run `$ echo source '/path/to/manifest.sh' >> ~/.bashrc`
4. It will be usable whenever your terminal session starts. If you want to avoid restarting terminal,   just do `$ source '/path/to/manifest.sh`

# How to use:
`$ manifest_search <show_these> <dont_show_these>`

Simple as that.

# Simple Example 1: Cats and dogs
Add do you want to see an example function of cat with file.pnq sample file"

You can simply write
$ manifest_search wireshark separate
This will group and separate affects in terms of different products.

Statement: I want to see cat-white and cat-1 and small-cat
file.pnq sample file

Command:
$ manifest_search

**Screenshot**

#EXAMPLE 2 : kernel

Statement: I want to see both kernel-rt and kernel-alt

$ manifest_search 'kernel-alt|kernel-rt'

**Screenshot**

manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'

manifest_search term1(what you want to have) term2(what you dont want to have)

make sure you don't do term1 term1. term1-term2

http://pastebin.test.redhat.com/767323 : This is what I do for kernel, which gets me kernel-5, kernel-rt, kernel-alt so that nothing is missed
lpardo, ^^

manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'

#EXAMPLE 3:

manifest_search '/glib-[0-9]|/glib[0-9]-|mingw-glib-[0-9]|/mingw-glib[0-9]'  separate

Use the keyword separate to view a grouped easy on the eyes affects

is the same as

$ manifest_search glib 'glibc|glibd|json|networking|dbus|json|tag|libvirt|libgit|geocode|libappstream|glibmm|cglib|telepathy|perl|snapd|ghc|python|libac|libgs|template|signon|pcre|rubygem|rust|java|spglib|alglib|codeready'

1. $ manifest_search poppler 'rubygem|sharp|zathura|compat|poppler-data|python|pypoppler'

#EXAMPLE 4:
Problem statement:

lpardo, psampaio|AFK I get this output

manifest_search  'php-[0-9]|rh-php[0-9][0-9]-php' 'pear|pecl|codeready|dropbox|ring|captcha|less|mod|kdevelop|zipstream|jmespath|zxcvbn|scss|xmp'

OK that was easy, what about complex things like python urllib php

# Tasks to do:
- upload it to PS tools git repo
- Email to incoming. send this to thoger also as a reply to his mail Subject: [psr] Missing or incorrect flaw affects entries  
-. Optimise for packages like python : http://localhost:5600/static/#/flaw/1631420
-.    automatically do this in first filter :  echo ; echo "Make a practice to search:" ; echo "$ manifest_search '""/gd ""' first, to find out packages like 'gd (in php)'" ;

#Tips:
  - You can change the function name manifest_search to whatever you were already used to before to be more comfortable. But first use it and get some hands on.
  - Ask me: Hey I want to see these packages, I'll quickly form a command, and you'l quickly learn it.
  - you can further | grep rhscl these to show all kinds of php stuff only for rhscl. So we don't really need a separate manifest. but we dont need to do that since psmodules like rhscl are already grouped and separated

#sort
    echo ; echo "Make a practice to search:" ; echo "$ manifest_search '""/gd ""' first, to find out packages like 'gd (in php)'" ;

    echo ; echo "Also Make a practice to search:" ; echo "$ manifest_search '""solr[0-9]""' first, to find out packages like 'solr3' package"
