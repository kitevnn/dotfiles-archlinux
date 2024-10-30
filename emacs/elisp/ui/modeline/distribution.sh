cat /etc/os-release | grep "NAME" | sed -n '1p' | cut -c '7-16'
