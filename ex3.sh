#1/bin/bash

cat /etc/hosts | while read ip dom
do
	echo "ip: $ip, dom: $dom"
	if [ $ip = "##" ]
	then
		break
	fi
	output=$(nslookup "$dom" 3.3.3.4 | grep -m 2 '^Address:' | awk '{print $1}' | tail -n 1 )

	if [[ "$output" != "$ip" ]]; then
	  echo "Bonus Ip for $dom in/etc/hosts" 
        fi
done
