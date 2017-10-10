module TraxsourceParser
  module NokogiriHelper
    require 'open-uri'
    def self.nokogiri_doc(type, id)
      Nokogiri::HTML(open_traxsource(type, id))
    end

    def self.open_traxsource(type, id = nil)
      url = (type == 'home') ? 'https://www.traxsource.com/' : 'https://www.traxsource.com/' + type + '/' + id.to_s
      open(url)
    end
  end
end
