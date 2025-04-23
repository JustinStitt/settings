# relies on ness.jstitt.dev and api.jstitt.dev
# ness fills out ness.jstitt.dev/nessage and i fetch the log.txt from api.jstitt.dev/recent-nessage
# uses environment variable $NESSAGE_PASSWORD at ~/.env
# place in ~/.byobu/.tmux.conf
CACHE_FILE=/tmp/tmux-nessage-cache.tmp
PREVIOUS_ENTRY_FILE=/tmp/tmux-nessage-cache-entry.tmp
INTERVAL=1 # fetch nessage every 3 minutes

# source ~/.env
[ ! -f ~/.env ] || export $(grep -v '^#' .env | xargs)

get_and_write() {
  MESSAGE=$(curl "https://api.jstitt.dev/recent-nessage?pwd=$NESSAGE_PASSWORD" 2>/dev/null | jq -r '.detail')
  truncated_string=$(echo "$MESSAGE" | awk -v max_len="50" '{if (length($0) > max_len) {print substr($0, 1, max_len) "..."} else {print $0}}')
  echo -n $truncated_string >$PREVIOUS_ENTRY_FILE
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
