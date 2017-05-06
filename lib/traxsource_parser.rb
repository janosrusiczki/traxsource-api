module TraxsourceParser
  def self.home
    parser = TraxsourceParser::Home.new
    parser.home
  end

  def self.title(title_id)
    parser = TraxsourceParser::Title.new(title_id)
    parser.title
  end
end
