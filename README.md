# Instructions to install:
1. Clone this repo
2. Edit the manifest.sh file
  - Change just the two variables: `manifest_dir` and `containers_dir` in the manifest.sh  with the corresponding paths in your file system exactly as it is written there. I suggest using find and replace.
3. Run `$ echo source '/path/to/your/manifest_script/manifest.sh' >> ~/.bashrc`
4. It will be usable whenever your terminal session starts. If you want to avoid restarting terminal,   just do `$ source '/path/to/manifest.sh`

# How to use:
```
$ manifest_search <show_these> <dont_show_these>
```
OR
```
$ manifest_search <'show_this|and_this'> <'dont_show_this|and_this'>
```

Simple as that.

# Simple Example 1: Cats and dogs
Statement: I want to see cat-white and cat-1 and small-cat.

content of cats.txt:
```
cat-white
cat-1
small-cat
cat
big-cat
cat-is-god
rh-cat
cat95-cat
```

`$ manifest_search "cat-1|small-cat"`

Result:

```
cat-1
small-cat
```



#Example 2 : kernel : I want to see both kernel-rt and kernel-alt

`$ manifest_search 'kernel-alt|kernel-rt'`

![kernel-alt|kernel-rt](https://user-images.githubusercontent.com/32044701/59568287-5f4eba80-9096-11e9-9598-5848f3ee0bd2.png)

To view full kernel affects, try
$ manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'

You'll see something like this: http://pastebin.test.redhat.com/772199
This is what I do for kernel, which gets me kernel-5, kernel-rt, kernel-alt so that nothing is missed.

# Example 3: I want to see if we ship wireshark.

`$ manifest_search wireshark`
![wireshark_unseparated](https://user-images.githubusercontent.com/32044701/59568324-bf456100-9096-11e9-9d46-4070acab77dd.png)

See what happens when you run;
`$ manifest_search wireshark separated`

This will group and separate affects in terms of different products.
Magic? No. See how entries are grouped and separated by community products and enterprise products .It's easy on the eyes. This will happen for all the complex packages as well.

![wireshark](https://user-images.githubusercontent.com/32044701/59568228-88bb1680-9095-11e9-967b-abe0c84a4f8b.png)


# Example 4: poppler

`$ manifest_search poppler 'rubygem|sharp|zathura|compat|poppler-data|python|pypoppler'`
![poppler](https://user-images.githubusercontent.com/32044701/59568423-23b4f000-9098-11e9-824f-f2c399c29408.png)

The output that you see here, will directly go in to the affects section of `$sfm2 flaw create`. You don't need to find the needle in a haystack. Some day, we can have that automation.

# Example 4: glib

$ manifest_search glib 'glibc|glibd|json|networking|dbus|json|tag|libvirt|libgit|geocode|libappstream|glibmm|cglib|telepathy|perl|snapd|ghc|python|libac|libgs|template|signon|pcre|rubygem|rust|java|spglib|alglib|codeready|amazon'

Do I have to type so much? No, The above command is the same as the one below, which is very easy once you start using this script. Once you're aware how this works, you'll start using your intelligence and optimise the commands. 

$ manifest_search '/glib-[0-9]|/glib[0-9]-|mingw-glib-[0-9]|/mingw-glib[0-9]' 'amazon|codeready'


#EXAMPLE 4:
Problem statement:

lpardo, psampaio|AFK I get this output

$ manifest_search  'php-[0-9]|rh-php[0-9][0-9]-php' 'pear|pecl|codeready|dropbox|ring|captcha|less|mod|kdevelop|zipstream|jmespath|zxcvbn|scss|xmp'

OK that was easy, what about complex things like python urllib php

.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.
.

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
