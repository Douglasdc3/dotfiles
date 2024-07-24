function metar() {
   curl -s "https://aviationweather.gov/api/data/metar?ids=$1&format=raw"
}

function taf() {
   curl -s "https://aviationweather.gov/api/data/taf?ids=$1&format=raw"
}

