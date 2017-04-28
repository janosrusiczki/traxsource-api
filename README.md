## Setup

There's no configuration, it is deployable to [Heroku](https://www.heroku.com/) as is, it just needs the [mLab](https://mlab.com/) addon.

## Response format

Basically titles on Traxsource are either regular titles or bundles (which are DJ tops, hype charts and the likes).

### Regular title

GET /titles/785306

    {
      "title_id":"785306",
      "bundle":false,
      "promo":true,
      "title":"Evergreen",
      "full_title":"Vena - Evergreen",
      "label":{
        "name":"Rhythm \u0026 Culture Music",
        "id":"21928"
      },
      "catalog_number":"RNC050",
      "release_date":"2017-05-05",
      "price":"5.99",
      "description":"",
      "image":"https://geo-static.traxsource.com/files/images/745511_large.jpg",
      "artists":[
        {
          "name":"Vena",
          "id":"383404"
        }
      ],
      "tracks":[
        {
          "track_id":"4295125",
          "number":"1",
          "title":"Evergreen",
          "version":"Thomas Blondet Remix",
          "title_id":"785306",
          "full_title":"Evergreen (Thomas Blondet Remix)",
          "title_url":"/title/785306/evergreen",
          "track_url":"/track/4295125/evergreen-thomas-blondet-remix",
          "duration":"5:21",
          "artists":[
            {
              "id":383404,
              "name":"Vena"
            }
          ],
          "remixers":[
            {
              "id":103515,
              "name":"Thomas Blondet"
            }
          ],
          "label":{
            "id":21928,
            "name":"Rhythm \u0026 Culture Music"
          },
          "genre":{
            "id":"24",
            "name":"Soulful House"
          },
          "catnumber":"RNC050",
          "promo":true,
          "release_date":"2017-05-05",
          "price":{
            "hbr":2.99,
            "wav":3.74
          },
          "preorder":0,
          "image_full":"http://geo-static.traxsource.com/files/images/745511_large.jpg",
          "image_thumb":"http://geo-static.traxsource.com/scripts/image.php/44x44/745511.jpg",
          "mp3":"http://geo-preview.traxsource.com/files/previews/21928/3705260-p.mp3",
          "waveform":"http://geo-static.traxsource.com/files/wf/3705260-wf.png",
          "bpm":"120",
          "key_signature":"Emin"
        },
        {
          "track_id":"4295126",
          "number":"2",
          "title":"Evergreen",
          "version":"Thomas Blondet's Dub Remix",
          "title_id":"785306",
          "full_title":"Evergreen (Thomas Blondet's Dub Remix)",
          "title_url":"/title/785306/evergreen",
          "track_url":"/track/4295126/evergreen-thomas-blondets-dub-remix",
          "duration":"5:21",
          "artists":[
            {
              "id":383404,
              "name":"Vena"
            }
          ],
          "remixers":[
            {
              "id":103515,
              "name":"Thomas Blondet"
            }
          ],
          "label":{
            "id":21928,
            "name":"Rhythm \u0026 Culture Music"
          },
          "genre":{
            "id":"24",
            "name":"Soulful House"
          },
          "catnumber":"RNC050",
          "promo":true,
          "release_date":"2017-05-05",
          "price":{
            "hbr":2.99,
            "wav":3.74
          },
          "preorder":0,
          "image_full":"http://geo-static.traxsource.com/files/images/745511_large.jpg",
          "image_thumb":"http://geo-static.traxsource.com/scripts/image.php/44x44/745511.jpg",
          "mp3":"http://geo-preview.traxsource.com/files/previews/21928/3705261-p.mp3",
          "waveform":"http://geo-static.traxsource.com/files/wf/3705261-wf.png",
          "bpm":"119",
          "key_signature":"Emin"
        }
      ]
    }

### Bundle

GET /titles/795133

    {
      "title_id":"795133",
      "bundle":true,
      "promo":false,
      "title":"Boddhi Satva Top 10 (April 2017)",
      "full_title":"Boddhi Satva Top 10 (April 2017)",
      "label":{
        "name":"Top 10",
        "id":"934"
      },
      "catalog_number":"DJC-6890",
      "release_date":"2017-04-25",
      "price":"20.90",
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
          "track_id":"4352475",
          "number":"1",
          "title":"Salat Ala Nabina ",
          "version":"",
          "title_id":"795133",
          "full_title":"Salat Ala Nabina ",
          "title_url":"/title/784062/salat-ala-nabina-feat-kwatar-sadik",
          "track_url":"/track/4288057/salat-ala-nabina",
          "duration":"5:19",
          "artists":[
            {
              "id":250877,
              "name":"Mr. ID"
            },
            {
              "id":382812,
              "name":"Kawtar Sadik"
            }
          ],
          "remixers":[

          ],
          "label":{
            "id":11445,
            "name":"Offering Recordings"
          },
          "genre":{
            "id":"27",
            "name":"Afro House"
          },
          "catnumber":"OR093",
          "promo":false,
          "release_date":"2017-04-21",
          "price":{
            "hbr":1.99,
            "wav":2.74
          },
          "preorder":0,
          "image_full":"http://geo-static.traxsource.com/files/images/744398_large.jpg",
          "image_thumb":"http://geo-static.traxsource.com/scripts/image.php/44x44/744398.jpg",
          "mp3":"http://geo-preview.traxsource.com/files/previews/11445/3699989-p.mp3",
          "waveform":"http://geo-static.traxsource.com/files/wf/3699989-wf.png",
          "bpm":"124",
          "key_signature":"Fmaj"
        },
        {
          "track_id":"4352476",
          "number":"2",
          "title":"Supreme",
          "version":"feat. AfroTura",
          "title_id":"795133",
          "full_title":"Supreme (feat. AfroTura)",
          "title_url":"/title/755656/aso-feat-afrotura",
          "track_url":"/track/4118199/supreme-feat-afrotura",
          "duration":"5:01",
          "artists":[
            {
              "id":297328,
              "name":"AfroTura"
            },
            {
              "id":191008,
              "name":"Corinda"
            }
          ],
          "remixers":[

          ],
          "label":{
            "id":11445,
            "name":"Offering Recordings"
          },
          "genre":{
            "id":"27",
            "name":"Afro House"
          },
          "catnumber":"OR90",
          "promo":false,
          "release_date":"2017-02-10",
          "price":{
            "hbr":1.99,
            "wav":2.74
          },
          "preorder":0,
          "image_full":"http://geo-static.traxsource.com/files/images/718090_large.jpg",
          "image_thumb":"http://geo-static.traxsource.com/scripts/image.php/44x44/718090.jpg",
          "mp3":"http://geo-preview.traxsource.com/files/previews/11445/3557906-p.mp3",
          "waveform":"http://geo-static.traxsource.com/files/wf/3557906-wf.png",
          "bpm":"121",
          "key_signature":"Dmin"
        }
      ]
    }
