#### internet connection #######################################################

# function checking (inter)net connection -- ToDo
function internetok(){
	local times=1
	local domain=192.168.1.1
	local tmp=$(ping $domain -c $times -W 5 | tail -n 2  ) 
	local iffer=${#tmp}
	if [ $iffer == 0 ]
	then 
			echo 10000 0 $times 10000 $date $domain >> ~/logs/internet_ok.log
			local M=10001
	else
			local ms=$(echo $tmp | egrep -o '/[[:digit:]]+\.[[:digit:]]+/' | egrep -o '[[:digit:]]+\.[[:digit:]]+')
			local pkg=$(echo $tmp | egrep -o ', +[[:digit:]]+[^%]' | egrep -o '[[:digit:]]+')
			local meantime=$ms
    	local date=$(date '+%Y-%m-%d %H:%M:%S')
			echo $meantime $pkg $times $ms $date $domain >> ~/logs/internet_ok.log
			local M=$meantime
	fi

	local domain=google.com
	local tmp=$(ping $domain -c $times -W 5 | tail -n 2  ) 
	local iffer=${#tmp}
	if [ $iffer == 0 ]
	then
		echo 10000 0 $times 10000 $date $domain >> ~/logs/internet_ok.log
		local M=$(bc <<< "10002 + $meantime")
	else
			local ms=$(echo $tmp | egrep -o '/[[:digit:]]+\.[[:digit:]]+/' | egrep -o '[[:digit:]]+\.[[:digit:]]+')
		local pkg=$(echo $tmp | egrep -o ', +[[:digit:]]+[^%]' | egrep -o '[[:digit:]]+')
		local meantime=$ms
    local date=$(date '+%Y-%m-%d %H:%M:%S')
		echo $meantime $pkg $times $ms $date $domain >> ~/logs/internet_ok.log
	fi 
	local M=$(bc <<< "$M + $meantime")
	echo $M 
}

# function making pi glow
function internet_to_glow(){
	t=$(internetok | egrep -o '^[[:digit:]]+')
	echo $t
	piglow off 
	piglow red 10
	if [ "$t" -le 150 ]
	  then
	    piglow off 
	    piglow led 1 3 1
		fi
	if [ "$t" -ge 150 ]
	  then
	    piglow off 
			piglow led 1 4 1
	  fi
}
