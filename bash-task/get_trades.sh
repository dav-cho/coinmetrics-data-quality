#!/bin/zsh

get_timeseries_market_trades() {
  local BASE_URL='https://community-api.coinmetrics.io/v4/timeseries/market-trades'
  local MARKETS=$1
  local TIME_OFFSET=$2
  local PAGE_SIZE=10000
  local START_TIME=$(date -u -v "-${TIME_OFFSET}S" +'%Y-%m-%dT%H:%M:%SZ')

  local url="${BASE_URL}?markets=${MARKETS}&start_time=${START_TIME}&page_size=${PAGE_SIZE}&pretty=true"
  local response=$(curl $url)
  echo $response

  local page_count=1
  echo $response > "page-${page_count}.json"
  page_count=$((page_count+1))

  # The following was added in case the results are greater than the page size
  local next_url=$(echo $response | python -c 'import sys, json; print(json.load(sys.stdin).get("next_page_url", ""))')
  echo '~' $(echo $response | python -c 'import sys, json; print(len(json.load(sys.stdin).get("data", [])))') 'Trades found in page.'

  while [ $#next_url -gt 0 ]
  do
    local next_response=$(curl "$next_url")
    echo $next_response
    echo $next_response > "page-${page_count}.Json"
    page_count=$((page_count+1))

    next_url=$(echo $next_response | python -c 'import sys, json; print(json.load(sys.stdin).get("next_page_url", ""))')

    echo '~' $(echo $next_response | python -c 'import sys, json; print(len(json.load(sys.stdin).get("data", [])))') 'Trades found in page.'
  done

  echo '~' $((page_count-1)) 'Pages Found.'
}

get_timeseries_market_trades $1 $2

