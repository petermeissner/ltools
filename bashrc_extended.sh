#### map STUPID Thinkpad forward/backward keys to awesome POS1 / HOME  #########
if hash Rscript 2>/dev/null; then
	display_exists=`Rscript -e 'cat(ifelse(Sys.getenv("DISPLAY") != "", 1, 0)); cat("\n")';`
	if [ $display_exists -eq "1" ]
	then
		xmodmap -e 'keycode 166=Home';
		xmodmap -e 'keycode 167=End';
	fi
fi

#### set up prompt #############################################################

source ~/.git-completion.bash
source ~/.git-prompt.bash

GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_DESCRIBE_STYLE="describe"
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h \e[33m$(__git_ps1 "(%s)")\[\033[01;34m\] \w \$\[\033[00m\]\n'






#### aliases ###################################################################
alias R='R --no-save'
alias cd..='cd ..'




#### terminal convenience ######################################################

function minimalprompt(){
    export PS1='> '
}




#### system functions ##########################################################

function running(){
	ps -ax | grep $1
}

# reload bashrc
function reloadbashrc(){
	source ~/.bashrc
}




#### GIT  ######################################################################



# lazygit function
function lazygit() {
    git add -A
    if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m "--"
    fi
    git push
}


# git status
function gits(){
	git status
}




#### lazy apt ##################################################################

# lazy installation function
function aptinstall() {
	sudo apt-get install $1
}

# lazy apt search function
function aptsearch(){
	apt-cache search $1
}



#### C programming #############################################################

# debug c program
function debug_c(){
	gdb --batch --ex r --ex bt --ex q --args $1
}



#### adding scripts to path ####################################################

export PATH=$PATH:~/ltools/scripts

