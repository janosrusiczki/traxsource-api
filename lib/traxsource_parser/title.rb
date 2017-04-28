module TraxsourceParser
  # encapsulation ftw
  class Title
    def initialize(title_id)
      @title_id = title_id
      @doc = TraxsourceParser::NokogiriHelper.nokogiri_doc('title', @title_id)
      @title = Hash.new
      @bundle = false
    end

    def title
      @bundle = is_bundle?
      get_general_data
      get_artists
      get_tracks
      @title
    end

    def is_bundle?
      @bundle = @doc.css('div.trklist').attr('class').value.include?('bund')
    end

    def get_general_data
      @title[:title_id] = @title_id
      @title[:bundle] = @bundle
      if @bundle
        @title[:promo] = false
      else
        @title[:promo] = (@doc.at_css('.ttl-block img.promo')) ? true : false;
      end
      @title[:title] = @doc.css("span.title").first.text
      @title[:full_title] = @doc.css("meta[property='og:title']").first.attributes['content'].value
      label_link = @doc.css('h1.page a.com-label')
      @title[:label] = {
        name: label_link.text,
        id: /(\d+)/.match(label_link.attribute('href').value)[1]
      }
      catalog_number_release_date = /([^\s\|]+)\s\|\s([^\s]+)/.match(@doc.css('div.cat-rdate').text)
      @title[:catalog_number] = catalog_number_release_date[1]
      @title[:release_date] = catalog_number_release_date[2]
      @title[:price] = @doc.css('.btns a.com-buy span.price').text[1..-1]
      @title[:description] = @doc.css('div.desc').text
      @title[:image] = @doc.css('div.t-image img').attribute('src').value
    end

    def get_artists
      artists = []
      @doc.css("span.artists a").each do |a|
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
      @doc.css('.trk-row').each do |t|
        tracks << {
          track_id: t.attribute('data-trid').value,
          number: t.css('div.tnum').text,
          title: t.css('.title a').text,
          version: /^(.*)\s\(\d+\:/.match(t.css('.version').text)[1],
        }
      end
      playlist_tracks = Playlist.playlist(tracks.map{ |t| t[:track_id].to_i })
      tracks.each_with_index do |t,i|
        t.merge! playlist_tracks[i]
      end
      @title[:tracks] = tracks
    end

  end
end
