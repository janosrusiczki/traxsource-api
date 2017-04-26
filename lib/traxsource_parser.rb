module TraxsourceParser
  def self.title(title_id)
    parser = TraxsourceParser::Title.new(title_id)
    parser.title
  end
end
