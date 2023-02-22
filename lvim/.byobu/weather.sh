CACHE_FILE=/tmp/tmux-weather-cache.tmp
PREVIOUS_ENTRY_FILE=/tmp/tmux-weather-cache-entry.tmp
INTERVAL=360 # fetch weather every 6 minutes

# file doesn't exist yet, create it
if [ ! -f $CACHE_FILE ]
then
  echo $(date +%s) > $CACHE_FILE
fi

if [ ! -f $PREVIOUS_ENTRY_FILE ]
then
  CURRENT_TEMP=$(curl https://wttr.in/Fullerton\?format\="%l:+%C+%t+(UV:+%u)" 2>/dev/null)
  echo -n $CURRENT_TEMP > $PREVIOUS_ENTRY_FILE
fi

PREVIOUS_TIME=$(head -1 $CACHE_FILE)
CURRENT_TIME=$(date +%s)
DELTA=$(($CURRENT_TIME - $PREVIOUS_TIME))

# write current time to file
echo $CURRENT_TIME > $CACHE_FILE

if [ $DELTA -gt $INTERVAL ]
then
  # update previous entry file
  CURRENT_TEMP=$(curl https://wttr.in/Fullerton\?format\="%l:+%C+%t+(UV:+%u)" 2>/dev/null)
  echo -n $CURRENT_TEMP > $PREVIOUS_ENTRY_FILE
fi

PREVIOUS_ENTRY=$(head -1 $PREVIOUS_ENTRY_FILE)
echo -n $PREVIOUS_ENTRY
