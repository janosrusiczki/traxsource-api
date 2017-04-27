# SETUP

This is deployable to Heroku as is it just needs the mLab addon.

## Response format

### Regular title

Basically titles on Traxsource are either regular titles or bundles (which are DJ tops, hype charts and the likes).

GET /titles/785306

    {
      "bundle": false,
      "promo": true,
      "title": "Evergreen",
      "full_title": "Vena - Evergreen",
      "label": {
        "name": "Rhythm & Culture Music",
        "id": "21928"
      },
      "catalog_number": "RNC050",
      "release_date": "2017-05-05",
      "price": "$5.99",
      "description": "",
      "image": "https://geo-static.traxsource.com/files/images/745511_large.jpg",
      "artists": [
        {
          "name": "Vena",
          "id": "383404"
        }
      ],
      "tracks": [
        {
          "id": "4295125",
          "number": "1",
          "title": "Evergreen",
          "version": "Thomas Blondet Remix",
          "duration": "5:21",
          "artists": [
            {
              "name": "Vena",
              "id": "383404"
            }
          ],
          "remixers": [
            {
              "name": "Thomas Blondet",
              "id": "103515"
            }
          ],
          "genre": {
            "name": "Soulful House",
            "id": "24"
          },
          "price": "$2.99"
        },
        {
          "id": "4295126",
          "number": "2",
          "title": "Evergreen",
          "version": "Thomas Blondet's Dub Remix",
          "duration": "5:21",
          "artists": [
            {
              "name": "Vena",
              "id": "383404"
            }
          ],
          "remixers": [
            {
              "name": "Thomas Blondet",
              "id": "103515"
            }
          ],
          "genre": {
            "name": "Soulful House",
            "id": "24"
          },
          "price": "$2.99"
        }
      ]
    }
    
### Bundle

GET /titles/795133

    {
      "bundle":true,
      "promo":false,
      "full_title":"Boddhi Satva Top 10 (April 2017)",
      "title":"Boddhi Satva Top 10 (April 2017)",
      "label":{
        "name":"Top 10",
        "id":"934"
      },
      "catalog_number":"DJC-6890",
      "release_date":"2017-04-25",
      "price":"$21.90",
      "description":"",
      "image":"https://geo-static.traxsource.com/files/images/b795133_large.jpg",
      "artists":[
        {
          "name":"Boddhi Satva",
          "id":"1989"
        }
      ],
      "tracks":[
        {
          "id":"4352475",
          "number":"1",
          "title":"Salat Ala Nabina ",
          "version":"",
          "duration":"5:19",
          "artists":[
            {
              "name":"Mr. ID",
              "id":"250877"
            },
            {
              "name":"Kawtar Sadik",
              "id":"382812"
            }
          ],
          "remixers":[

          ],
          "genre":{
            "name":"Afro House",
            "id":"27"
          },
          "price":"$1.99",
          "image":"https://geo-static.traxsource.com/scripts/image.php/44x44/744398.jpg",
          "promo":false
        },
        {
          "id":"4352476",
          "number":"2",
          "title":"Supreme",
          "version":"feat. AfroTura",
          "duration":"5:01",
          "artists":[
            {
              "name":"AfroTura",
              "id":"297328"
            },
            {
              "name":"Corinda",
              "id":"191008"
            }
          ],
          "remixers":[

          ],
          "genre":{
            "name":"Afro House",
            "id":"27"
          },
          "price":"$1.99",
          "image":"https://geo-static.traxsource.com/scripts/image.php/44x44/718090.jpg",
          "promo":false
        }
      ]
    }
