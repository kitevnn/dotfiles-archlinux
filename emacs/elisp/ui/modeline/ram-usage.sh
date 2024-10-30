ram_usage=$(free -h | grep Gi | sed -n '1p' | cut -c '30-31')

if [ "$ram_usage" -gt 8 ]; then
    echo "$(free -h | grep Mi | sed -n '1p' | cut -c '31-33')M"
else
    echo "$(free -h | grep Mi | sed -n '1p' | cut -c '31-33')G"
fi
