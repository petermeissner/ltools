function server_status(){
		ps aux | grep nginx 
		curl 127.0.0.1/test | grep nginx/[[:digit:]].[[:digit:]].[[:digit:]]
}
