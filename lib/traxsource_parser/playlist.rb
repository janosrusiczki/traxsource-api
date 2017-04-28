module TraxsourceParser
  class Playlist
    # provide an array of track ids
    def self.playlist(track_ids)
      url = 'http://w-static.traxsource.com/scripts/playlist.php?tracks=' + track_ids.join(',')
      doc = Nokogiri::XML(open(url))
      dirty_json = doc.css('data').first.text
      json = dirty_json.gsub(/([a-z0-9_]+)\:\s/, '"\1": ')
      parsed = JSON.parse(json)
      tracks = []
      parsed.each do |t|
        track = {}
        track[:track_id] = t['track_id']
        track[:title_id] = t['title_id']
        track[:full_title] = t['title']
        track[:title_url] = t['title_url']
        track['track_url'] = t['track_url']
        track[:duration] = t['duration']
        artists, remixers = [], []
        t['artist'].each do |a|
          type = a[1]
          artist = { id: a[0], name: a[2] }
          if type == 1
            artists << artist
          elsif type == 2
            remixers << artist
          end
        end
        track[:artists] = artists
        track[:remixers] = remixers
        track[:label] = { id: t['label'][0], name: t['label'][1] }
        track[:genre] = { id: /\/(\d+)\//.match(t['genre_url'])[1], name: t['genre'] }
        track[:catnumber] = t['catnumber']
        track[:promo] = t['promo']
        track[:release_date] = t['r_date']
        track[:price] = t['price']
        track[:preorder] = t['preorder']
        track[:image_full] = t['image']
        track[:image_thumb] = t['thumb']
        track[:mp3] = t['mp3']
        track[:waveform] = t['waveform']
        track[:bpm] = t['bpm']
        track[:key_signature] = t['keysig']
        tracks << track
      end
      tracks
    end
  end
end
