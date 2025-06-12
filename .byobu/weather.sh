# https://open-meteo.com/en/docs?forecast_days=3&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,precipitation_probability_max&latitude=37.3688&longitude=-122.0363&timezone=America%2FLos_Angeles&temperature_unit=fahrenheit&wind_speed_unit=mph&precipitation_unit=inch&current=temperature_2m,precipitation&hourly=
CACHE_FILE=/tmp/tmux-weather-cache.tmp
PREVIOUS_ENTRY_FILE=/tmp/tmux-weather-cache-entry.tmp
INTERVAL=180 # fetch weather every 3 minutes
API_URL="https://api.open-meteo.com/v1/forecast?latitude=37.3688&longitude=-122.0363&daily=weather_code,temperature_2m_max,temperature_2m_min,uv_index_max,precipitation_probability_max&current=temperature_2m,precipitation&timezone=America%2FLos_Angeles&forecast_days=3&wind_speed_unit=mph&temperature_unit=fahrenheit&precipitation_unit=inch"

get_and_write() {
  RESPONSE=$(curl -s $API_URL)
  # RESPONSE=$(cat $HOME/.byobu/weather.json)

  PARSED=$(echo $RESPONSE | jq '. as $p
  | $p.current.temperature_2m | round as $tcur
  | $p.daily.temperature_2m_max[0] | round as $tmax
  | $p.daily.temperature_2m_min[0] | round as $tmin
  | $p.daily.temperature_2m_max[1] | round as $tmrwmax
  | $p.daily.temperature_2m_min[1] | round as $tmrwmin
  | $p.current.precipitation | round as $pcur
  | $p.daily.precipitation_probability_max[0] as $ptdy
  | $p.daily.precipitation_probability_max[1] as $ptmrw
  | $p.daily.uv_index_max[0] | round as $uvtdy
  | $p.daily.uv_index_max[1] | round as $uvtmrw
  | "🏡\($tcur)(\($tmin)-\($tmax),\($tmrwmin)-\($tmrwmax)) 💧\($pcur)%(\($ptmrw)) 🔥\($uvtdy)(\($uvtmrw))"
  ')

  echo -n $PARSED | sed 's/"//g' >$PREVIOUS_ENTRY_FILE
}

# file doesn't exist yet, create it
if [ ! -f $CACHE_FILE ]; then
  echo $(date +%s) >$CACHE_FILE
fi

if [ ! -f $PREVIOUS_ENTRY_FILE ]; then
  get_and_write
fi

PREVIOUS_TIME=$(head -1 $CACHE_FILE)
CURRENT_TIME=$(date +%s)
DELTA=$(($CURRENT_TIME - $PREVIOUS_TIME))

if [ $DELTA -gt $INTERVAL ]; then
  get_and_write
  # update previous entry file
  echo $CURRENT_TIME >$CACHE_FILE
fi

PREVIOUS_ENTRY=$(head -1 $PREVIOUS_ENTRY_FILE)
echo -n $PREVIOUS_ENTRY
