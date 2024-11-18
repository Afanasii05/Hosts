#1/bin/bash

cat /etc/hosts | while read ip dom
do
	echo "ip: $ip, dom: $dom"
	if [ $ip = "#" ]
	then
		break
	fi
	output=$(nslookup "$dom" 8.8.8.8 | grep -m 2 '^Address:' | awk '{print $2}' | tail -n 1 )

	if [[ "$output" != "$ip" ]]; then
	  echo "Bonus Ip for $dom in/etc/hosts" 
        fi
done
