#!/bin/zsh

get_timeseries_market_trades() {
  local BASE_URL='https://community-api.coinmetrics.io/v4/timeseries/market-trades'
  local MARKETS=$1
  local TIME_OFFSET=$2
  local PAGE_SIZE=10000

  local START_TIME=$(date -u -v "-${TIME_OFFSET}S" +'%Y-%m-%dT%H:%M:%SZ')
  local URL="${BASE_URL}?markets=${MARKETS}&start_time=${START_TIME}&page_size=${PAGE_SIZE}&pretty=true"

  local RESPONSE=$(curl $URL)
  echo $RESPONSE

  local PAGE_COUNT=1
  echo $RESPONSE > "page-${PAGE_COUNT}.json"
  PAGE_COUNT=$((PAGE_COUNT+1))

  # The following was added in case the results are greater than the page size
  local NEXT_URL=$(echo $RESPONSE | python -c 'import sys, json; print(json.load(sys.stdin).get("next_page_url", ""))')
  echo '~' $(echo $RESPONSE | python -c 'import sys, json; print(len(json.load(sys.stdin).get("data", [])))') 'Trades found in page.'

  while [ $#NEXT_URL -gt 0 ]
  do
    local NEXT_RESPONSE=$(curl "$NEXT_URL")
    echo $NEXT_RESPONSE
    echo $NEXT_RESPONSE > "page-${PAGE_COUNT}.json"
    PAGE_COUNT=$((PAGE_COUNT+1))

    NEXT_URL=$(echo $NEXT_RESPONSE | python -c 'import sys, json; print(json.load(sys.stdin).get("next_page_url", ""))')

    echo '~' $(echo $NEXT_RESPONSE | python -c 'import sys, json; print(len(json.load(sys.stdin).get("data", [])))') 'Trades found in page.'
  done

  echo '~' $((PAGE_COUNT-1)) 'Pages Found.'
}

get_timeseries_market_trades $1 $2

