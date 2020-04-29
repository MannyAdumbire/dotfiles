
--ABOUT--

ViMypager is a plugin which soothes out most of the clunkyness when vim is used as a pager for mysql.

Default behaviour is to print to stdout if the screen is large enough to display all the text. 
This is similar to using the less flags ( -F, -X) as described on the Mysql version 5.7 man page :

>>>> The -F and -X options may be used with less to cause it to exit if output fits on one screen, which is convenient when no scrolling is necessary:
>>>> mysql> pager less -n -i -S -F -X


--USAGE--

To setup the plugin in vim, Install using your favorite vim plugin manager, or ":source /path/to/vi/my/pager/vimypager.vim"

To get the plugin working with mysql use the command below anyhere mysql accpets a pager command:

----------------------------------------------------------------------------------------------------
vim -R -c 'set nomod nonu' -c 'silent call vimypager#Run()' -

----------------------------------------------------------------------------------------------------

--Example--

Here is are contents to a sample .my.cnf file which uses vimypager:

[mysql]
 pager=vim -R -c 'set nomod nonu' -c 'silent call vimypager#Run()' -

