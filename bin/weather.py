#!/usr/bin/env python3

import json
import urllib
import urllib.parse
import urllib.request
import os

def main():
    city = "Ulaanbaatar"
    api_key = "4dad11062bccaaf6afad1c24823ec9fa"

    try:
        data = urllib.parse.urlencode({'q': city, 'appid': api_key, 'units': 'metric'})
        weather = json.loads(urllib.request.urlopen(
            'http://api.openweathermap.org/data/2.5/weather?' + data)
            .read())
        desc = weather['weather'][0]['description'].capitalize()
        temp = int(float(weather['main']['temp']))
        #return '{}, {}°C'.format(desc, temp)
        return '{}°C'.format(temp)
    except:
        return ''


if __name__ == "__main__":
	print(main())
