# 一定要记得将weather天气情况保存在~/.config/emacs/archive或者下面的路径自己根据实际情况纠正一下
# 如果数据没有更新，请自己手动拉一下保存到本地文件(或请自己使用付费API)
weather_situation=$(cat /home/une/.config/emacs/archive/weather | sed -n '3p' | cut -c '32-50' | tr -d ' ')
weather_temperature=$(cat /home/une/.config/emacs/archive/weather | sed -n '4p' | cut -c '43-44' | tr -d ' ')
weather_location1=$(cat /home/une/.config/emacs/archive/weather | sed -n '38p' | awk -F ', ' '{print $2}' | cut -c '1-9')
weather_location2=$(cat /home/une/.config/emacs/archive/weather | sed -n '38p' | awk -F ', ' '{print $3}')

case $weather_situation in
  Sunny)
    echo "󰫕 晴朗 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Clear)
    echo "󰫕 明朗 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  PartlyCloud)
    echo "部分多云 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Overcast)
    echo "大多多云 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Rain)
    echo "󰖖 雨 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Thunderstorm)
    echo "雷暴 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Mist)
    echo "雾气 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Fog)
    echo "烟雾 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Drizzle)
    echo "毛毛细雨 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Showers)
    echo "阵雨 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
  Haze)
    echo "阴霾 $weather_temperature°C $weather_location1, $weather_location2"
    ;;
esac
