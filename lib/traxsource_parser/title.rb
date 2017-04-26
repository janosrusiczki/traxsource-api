module TraxsourceParser
  # encapsulation ftw
  class Title
    def initialize(title_id)
      @doc = TraxsourceParser::NokogiriHelper.nokogiri_doc('title', title_id)
      @title = Hash.new
    end

    def title
      get_general_data
      get_artists
      get_tracks
      @title
    end

    def get_general_data
      @title[:full_title] = @doc.css("meta[property='og:title']").first.attributes['content'].value
      @title[:title] = @doc.css("span.title").first.text
      label_link = @doc.css('span.label a')
      @title[:label] = {
        name: label_link.text,
        id: /(\d+)/.match(label_link.attribute('href').value)[1]
      }
      catalog_number_release_date = /([^\s\|]+)\s\|\s([^\s]+)/.match(@doc.css('div.cat-rdate').text)
      @title[:catalog_number] = catalog_number_release_date[1]
      @title[:release_date] = catalog_number_release_date[2]
      @title[:price] = @doc.css('div.buy-large span.price').text
      @title[:description] = @doc.css('div.desc').text
      @title[:image] = @doc.css('div.t-image img').attribute('src').value
    end

    def get_artists
      artists = []
      @doc.css("span.artist a").each do |a|
        artists << {
          name: a.text,
          id: a.attribute('data-aid').value,
        }
      end
      if artists.length == 0
        artists << {
          name: 'Various Artists'
        }
      end
      @title[:artists] = artists
    end

    def get_tracks
      tracks = []
      @doc.css('.play-trk').each do |t|
        version_duration = /^(.*)\s\((\d+\:\d+)\)$/.match(t.css('.version').text)
        track_artists = []
        t.css('.com-artists').each do |a|
          track_artists << {
            name: a.text,
            id: a.attribute('data-aid').value,
          }
        end
        remixers = []
        t.css('.com-remixers').each do |r|
          remixers << {
            name: r.text,
            id: r.attribute('data-aid').value,
          }
        end
        tracks << {
          number: t.css('div.tnum').text,
          title: t.css('td.artit a').text,
          version: version_duration[1],
          duration: version_duration[2],
          artists: track_artists,
          remixers: remixers,
          genre: {
            name: t.css('td.genre a').text,
            id: /\/(\d+)\//.match(t.css('td.genre a').attribute('href').value)[1],
          },
          price: t.css('.com-buy span.price').text,
        }
      end
      @title[:tracks] = tracks
    end

    # provide an array of track ids
    # use this to patch the tracks array above
    def playlist(track_ids)
      url = 'http://w-static.traxsource.com/scripts/playlist.php?tracks=' + track_ids.join(',')
      doc = Nokogiri::XML(open(url))
      dirty_json = doc.css('data').first.text
      json = dirty_json.gsub(/([a-z0-9_]+)\:\s/, '"\1": ')
      parsed = JSON.parse(json)
      pp parsed
      tracks = {}
      parsed.each do |t|
        tracks[t['track_id']] = {
          track_id: t['track_id'],
          title_id: t['title_id'],
          artist: t['artist'],
        }
      end
      tracks
    end
  end
end
