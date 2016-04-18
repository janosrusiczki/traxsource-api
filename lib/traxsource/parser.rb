module Traxsource
  require 'open-uri'
  module Parser
    extend self
    def title(title_id)
      doc = nokogiri_doc('title', title_id)
      full_title = doc.css("meta[property='og:title']").first.attributes['content'].value
      title = doc.css("span.title").first.text
      artists = []
      doc.css("span.artist a").each do |a|
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
      label_link = doc.css('span.label a')
      label = {
        name: label_link.text,
        id: /(\d+)/.match(label_link.attribute('href').value)[1]
      }
      catalog_number_release_date = /([^\s\|]+)\s\|\s([^\s]+)/.match(doc.css('div.cat-rdate').text)
      catalog_number = catalog_number_release_date[1]
      release_date = catalog_number_release_date[2]
      price = doc.css('div.buy-large span.price').text
      description = doc.css('div.desc').text
      image = doc.css('div.t-image img').attribute('src').value
      tracks = []
      doc.css('.play-trk').each do |t|
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
      {
        full_title: full_title,
        title: title,
        artists: artists,
        label: label,
        catalog_number: catalog_number,
        release_date: release_date,
        price: price,
        description: description,
        image: image,
        tracks: tracks,
      }
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

    #private
    def nokogiri_doc(type, id)
      Nokogiri::HTML(open_traxsource(type, id))
    end

    def open_traxsource(type, id)
      url = 'http://www.traxsource.com/' + type + '/' + id.to_s
      open(url)
    end
  end
end
