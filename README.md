These are the work-simplifying scripts that I create and keep improving which keeps improving.

# How to install:
1. Clone this repo
2. Edit the manifest.sh file
  - Change just the two variables: `manifest_dir` and `containers_dir` in the manifest.sh  with the corresponding paths in your file system exactly as it is written there. I suggest using find and replace in your favourite text editor.
3. Run `$ echo source '/path/to/your_cloned/manifest_script/manifest.sh' >> ~/.bashrc`
4. The script will be usable whenever your terminal session starts. If you want to avoid restarting terminal,   just do `$ source 'path/to/your_cloned/manifest_script/manifest.sh'`

# How to use:
```
$ manifest_search <show_these> <dont_show_these>
```
OR
```
$ manifest_search <'show_this|and_this'> <'dont_show_this|and_this'>
```

Simple as that.

# Example 1: Cats and dogs
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

`$ manifest_search "cat-white|cat-1|small-cat"`

Result:

```
cat-white
cat-1
small-cat
```

You can also power use regex to see all versions of cat- as well as small-cat.

`$ manifest_search "cat-white|cat-[0-9]|small-cat"`


# Example 2 : kernel : I want to see both kernel-rt and kernel-alt

`$ manifest_search 'kernel-alt|kernel-rt'`

![kernel-alt|kernel-rt](https://user-images.githubusercontent.com/32044701/59568287-5f4eba80-9096-11e9-9598-5848f3ee0bd2.png)

To view all kernel affects, try:

```
$ manifest_search 'kernel-rt|kernel-alt|/kernel-' 'headers|xen|firmware|tools|python|utils'
```

You'll see something like this: http://pastebin.test.redhat.com/772199
This will gets you kernel-5, kernel-rt, kernel-alt so that nothing is missed.


# Example 3: php: A problem is a use case.

- Problem statement:

```
<lpardo>        the problem is when we like grep -Eir php-[0-9]
<Tausif>        hm hm
<lpardo>        we don't get matches like rh-php70-php
```
# Solution:
- php: `manifest_search '/php-[0-9]|/php[0-9]-|/php[0-9][0-9]-[0-9]|/php[0-9][0-9]-[0-9]|rh-php[0-9][0-9]-php-[0-9]' separated`

![php_new](https://user-images.githubusercontent.com/32044701/59624067-74d5ea00-9153-11e9-8adb-4cc103609cc6.png)

# Example 4: I want to see if we ship wireshark.

`$ manifest_search wireshark`

![wireshark_unseparated](https://user-images.githubusercontent.com/32044701/59568324-bf456100-9096-11e9-9d46-4070acab77dd.png)

See what happens when you run;
`$ manifest_search wireshark separated`

![wireshark](https://user-images.githubusercontent.com/32044701/59568228-88bb1680-9095-11e9-967b-abe0c84a4f8b.png)

This will group and separate affects in terms of different products like Fedora, Enterprise Linux, Openshift, etc.
Magic? No. See how entries are grouped and separated by community products and enterprise products .It's easy on the eyes. This will happen for all the complex packages as well.


# Example 5: poppler

`$ manifest_search poppler 'rubygem|sharp|zathura|compat|poppler-data|python|pypoppler|utils'`

is the same as [Simpler]:

`$ manifest_search 'mingw-poppler|/poppler-[0-9]' separated`

![poppler_new](https://user-images.githubusercontent.com/32044701/59624922-ab146900-9155-11e9-9d2a-d778296e6b3d.png)

The output that you see here, will directly go in to the affects section of `$sfm2 flaw create`, as affected or notaffected. You don't need to find the needle in a haystack. [ Some day, we can have that automation for #incoming ]

# Example 6: glib

```
$ manifest_search glib 'glibc|glibd|json|networking|dbus|json|tag|libvirt|libgit|geocode|libappstream|glibmm|cglib|telepathy|perl|snapd|ghc|python|libac|libgs|template|signon|pcre|rubygem|rust|java|spglib|alglib|codeready|amazon'
```

Do I have to type so much? No, the above command is the same as the one below, which is very easy once you start using this script. Once you're aware how this works, you'll start using your intelligence and optimise the commands.

```
$ manifest_search '/glib-[0-9]|/glib[0-9]-|mingw-glib-[0-9]|/mingw-glib[0-9]' 'amazon|codeready'
```
![glib](https://user-images.githubusercontent.com/32044701/59569665-74354900-90aa-11e9-9e55-4e3b7708b89d.png)

Getting it? It gets simplified.


# Example 7:

OK that was easy, what about complex things like python urllib?

- python: `manifest_search '/python-[0-9]|/python[0-9]-[0-9]|python[0-9][0-9]-[0-9]|rh-python[0-9][0-9]-python-[0-9]|python[0-9][0-9]-python-[0-9]' separated`

- python-urllib: `manifest_search '/python-urllib[0-9]-[0-9]|/python-urllib[0-3]' separated`

-Both: combine the above two

`manifest_search '/python-[0-9]|/python[0-9]-[0-9]|python[0-9][0-9]-[0-9]|rh-python[0-9][0-9]-python-[0-9]|python[0-9][0-9]-python-[0-9]|/python-urllib[0-9]-[0-9]|/python-urllib[0-3]' separated`


# Tips:
  - You can change the function name `manifest_search` to whatever you were already used to before to be more comfortable. But first use it and get some hands on.
  - If in doubt of any specific package, ask me: Hey, I want to see these packages, I'll quickly form a command, give it to you and you'll quickly learn it.
  - you can further `| grep rhscl` these to show all kinds of php stuff only for rhscl. So we don't really need a separate manifest(🤔) .But we don't even need to do that since PSmodules like rhscl are already grouped and separated.
  - you can simply scrape older flaw's PSComponent affects and add them in <show_these> argument ;)  🤫
  - If ' postgresql ' is not the package that you are searching, please manually add first term 'package [(]'
  - Discussion with Tomas: rh-package35-package is the actual package and rh-package35 is a meta package. Package names as rh-pyhon35 in affects are almost never correct. So, For RHSCL, we consider rh-package35-package instead of packages like rh-package35. This depends on having list of valid collections defined, which we only do for rhscl. So we're not sure about PSModules other than RHSCL. Also note that httpd24 in affects is wrong for rhscl, but it is/was correct for some jboss product jboss_enterprise_web_server:3.1.3/httpd24-2.4.6-62.ep7.el7


# More commands : #incoming, we can have a collection of these!

- postgresql: `manifest_search 'postgresql [(]in|postgresql-[0-9]|postgresql.jar|mingw-postgresql|rh-postgresql[0-9][0-9]-postgresql|postgresql[0-9][0-9]|postgresql[0-9][0-9]-postgresql' 'libs-|repmgr|apb|pglogical|jdbc|odbc|testing|perl|spacewalk|PGDG'
`

- Notice the embedded `embedded:enterprise_linux:8/postgresql (in libpq, client libs only)` is also shown in the output, because of the first term. We're reducing human errors to avoid missing anything. `Gotta catch 'em all!`

- Try doing it for gd ;) [I'm working to automate this part as well, so you don't have to].

`$manifest_search 'gd [(]|/gd-[0-9]' codeready`

![gd](https://user-images.githubusercontent.com/32044701/59624109-8dde9b00-9153-11e9-837a-c4c337e4f7de.png)



- mariadb: `manifest_search 'mariadb-|mariadb:[0-9][0-9].[0-9]/mariadb-|mariadb-galera|rh-mariadb[0-9][0-9][0-9]-mariadb' 'java|connector|client|container|apb|libs|pax'
`


- jackson-databind: `manifest_search 'jackson-databind-|rh-maven[0-9][0-9]-jackson-databind|rh-eclipse[0-9][0-9]-jackson-databind' `

- jquery: `manifest_search 'jquery|jquery[0-9]|jquery-|js-jquery[0-9]|js-jquery-|js-jquery[0-9]|js-jquery|python-XStatic-jQuery|epel-all|python-tw[0-9]-jquery|rubygem-jquery-rails|ruby[0-9][0-9][0-9]-rubygem-jquery-rails|ruby[0-9][0-9][0-9]-rubygem-jquery-ui-rails|tfm-rubygem-jquery-ui-rails|rh-ror[0-9][0-9]-rubygem-jquery-rails' 'Migrate|table|quicksearch|kibana|mouse|punch|upload|file|iframe|pretty|knob|jstree|datetime|qrcode|jqplot|noty|detached|hotkeys|ded3d|conventional|sizzle'`

- django: `manifest_search '/django[0-9][0-9]|/django-|python-django[0-9][0-9]|python-django-' 'python-django-[a-z]|django-[a-z]'`

- okhttp: `manifest_search /okhttp-[0-9]`

- pcre: `manifest_search 'mingw-pcre|pcre|mingw-pcre' 'container|alien|.dll|light|ocaml|regex|engine|pcre2`

- systemd: `manifest_search systemd 'hook|puppet|journal|plugin|github|bootchart|python|kcm|libs'`

- mysql: `manifest_search mysql 'apb|perl|Judy|java|rubygem|python|ipadic|connector|mecab|abp|lz4|multilib|auth|client|pax|puppet|storage|mmm|proxy|utilities|plugins|erlang|golang|groonga|report|tuner|pear|selinux|mysqlnd|plugin|nodejs|pam|tcl|lib|zrm|ocaml'
`

- nodejs-static-eval: `manifest_search nodejs-static-eval 0/nodejs`

- libjpeg-turbo: `manifest_search libjpeg-turbo separated`

- glib: `manifest_search '/glib-[0-9]|/glib[0-9]-|mingw-glib-[0-9]|/mingw-glib[0-9]'  separated`

- firefox: `manifest_search firefox-[0-9][0-9] separated`

- bootsrap-sass: `manifest_search bootstrap-sass separated`

- gstreamer: `manifest_search GStreamer 'ugly|good|base|bad|java|vaapi|tools|backend|gstreamer-python|perl|plugins|python|clutter|qt'`




# Thanks for Reading it till here



`bold`
`**bold**`
**bold**
