ram_usage=$(free -h | grep Gi | sed -n '1p' | cut -c '30-31' | tr -d ' ')

if [ "$ram_usage" -gt 7 ]; then
    echo "$(free -h | grep Mi | sed -n '1p' | cut -c '31-33' | tr -d ' ')M"
else
    echo "$(free -h | grep Gi | sed -n '1p' | cut -c '31-33' | tr -d ' ')G"
fi
