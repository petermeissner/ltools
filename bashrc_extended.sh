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

# wget -O ~/.git-completion.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completions.bash"
source ~/.git-completion.bash


# wget -O ~/.git-prompt.bash "https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh"
source ~/.git-prompt.bash




GIT_PS1_SHOWCOLORHINTS=true
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_DESCRIBE_STYLE="describe"
export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h \e[33m$(__git_ps1 "(%s)")\[\033[01;34m\] \w \$\[\033[00m\]\r\n'






#### aliases ###################################################################
alias R='R --no-save'
alias cd..='cd ..'

alias ll='ls -lh'
alias lla='ls -lah'


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

# lazygittag function
function lazygittag() {
	git tag "snap-$(date +%Y-%m-%d)" -m "lazy snapshot"
}

# lazygit function
function lazygit() {
    git add -A
    if [ -n "$1" ]
    then
        git commit -m "$1"
    else
        git commit -m "+  snap-$(date +%Y-%m-%d)"
    fi
    git push
}



# git status
function gits(){
	git branch
	echo -e "\e[93m$(git describe)\e[0m\n"
	git status
}

# git log
function gitl(){
	git log --pretty=format:"%h%x09%an%x09%ad%x09%s" --date=short
}


#### lazy apt ##################################################################

# lazy installation function
function apt-ins() {
	sudo apt-get install $1
}

# lazy apt search function
function apt-search(){
	apt-cache search $1
}



#### C programming #############################################################

# debug c program
function debug_c(){
	gdb --batch --ex r --ex bt --ex q --args $1
}



#### file watching ############################################################

function watch_file (){

### Set initial time of file
LTIME=`stat -c %Z $1`
printf "\033c"
echo -e "watching: $1 ---- $(date '+%Y-%m-%d %H:%M:%S')\n-------------------------------------------\n"
${@:2}

while true
do
   ATIME=`stat -c %Z $1`

   if [[ "$ATIME" != "$LTIME" ]]
   then
	printf "\033c"
	echo -e "watching: $1 ---- $(date '+%Y-%m-%d %H:%M:%S')\n-------------------------------------------\n"
	${@:2}
	LTIME=$ATIME
   fi
   sleep 1
done
}

#### adding scripts to path ####################################################

export PATH=$PATH:~/ltools/scripts



#### simple server ############################################################

alias simpleserve='python -m SimpleHTTPServer 8000'

