CACHE_FILE=/tmp/tmux-weather-cache.tmp
PREVIOUS_ENTRY_FILE=/tmp/tmux-weather-cache-entry.tmp
INTERVAL=1860 # fetch weather every 31 minutes

get_and_write() {
  CURRENT_TEMP=$(curl https://wttr.in/Sunnyvale\?format\="%l:+%C+%t+(UV:+%u)🌆@%s" 2>/dev/null)
  echo -n $CURRENT_TEMP | sed 's/...$//' > $PREVIOUS_ENTRY_FILE
}

# file doesn't exist yet, create it
if [ ! -f $CACHE_FILE ]
then
  echo $(date +%s) > $CACHE_FILE
fi

if [ ! -f $PREVIOUS_ENTRY_FILE ]
then
  get_and_write
fi

PREVIOUS_TIME=$(head -1 $CACHE_FILE)
CURRENT_TIME=$(date +%s)
DELTA=$(($CURRENT_TIME - $PREVIOUS_TIME))

if [ $DELTA -gt $INTERVAL ]
then
  get_and_write
  # update previous entry file
  echo $CURRENT_TIME > $CACHE_FILE
fi

PREVIOUS_ENTRY=$(head -1 $PREVIOUS_ENTRY_FILE)
echo -n $PREVIOUS_ENTRY
