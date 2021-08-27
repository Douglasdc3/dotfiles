function metar() {
   curl -s https://aviationweather.gov/adds/dataserver_current/httpparam\?dataSource\=metars\&requestType\=retrieve\&format\=xml\&stationString\=$1\&hoursBeforeNow\=2\&mostRecent\=true | grep raw_text | awk -F">" '{print $2}' | awk -F"<" '{print $1}'
}

function taf() {
   curl -s https://aviationweather.gov/adds/dataserver_current/httpparam\?dataSource\=tafs\&requestType\=retrieve\&format\=xml\&stationString\=$1\&hoursBeforeNow\=2\&mostRecent\=true | grep raw_text | awk -F">" '{print $2}' | awk -F"<" '{print $1}'
}

