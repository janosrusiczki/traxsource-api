module TraxsourceParser
  class Home
    def initialize
      @doc = TraxsourceParser::NokogiriHelper.nokogiri_doc('home', nil)
      @home = Hash.new
    end

    def home
      get_top10
      get_scabs
      get_banners
      @home
    end

    def get_top10
      track_ids = @doc.at('#topTenBay input#playAllIDs')['value'].split(',')
      @home[:top10] = Playlist.playlist_tracks(track_ids)
    end

    def get_scabs
      scabs = []
      @doc.css('#leftScabBay a,#rightScabBay a').each do |s|
        if s.attribute('href').value.include? '/title/'
          scabs << {
            is_title: true,
            title_id: /\/(\d+)\//.match(s.attribute('href').value)[1],
            image_full: 'http://geo-static.traxsource.com/files/images/' + /\/(\w+)\_large/.match(s.at('img').attribute('src').value)[1] + '_large.jpg'
          }
        else
          scabs << {
            is_title: false,
            link: s.attribute('href').value,
            image_full: s.at('img').attribute('src').value,
          }
        end
      end
      @home[:scabs] = scabs
    end

    def get_banners
      banners = []
      @doc.css('#bannerBay a').each do |b|
        if b.attribute('href').value.include? '/title/'
          banners << {
            is_title: true,
            title_id: /\/(\d+)\//.match(b.attribute('href').value)[1],
            image_full: 'http://geo-static.traxsource.com/files/images/' + /\/(\w+)\_large/.match(b.at('img').attribute('src').value)[1] + '_large.jpg'
          }
        else
          banners << {
            is_title: false,
            link: b.attribute('href').value,
            image_full: b.at('img').attribute('src').value,
          }
        end
      end
      @home[:banners] = banners
    end
  end
end
