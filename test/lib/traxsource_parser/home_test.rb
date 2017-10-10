require 'test_helper'

describe TraxsourceParser::Home do
    before do
      VCR.insert_cassette 'traxsource_parser_home', record: :new_episodes
      @tp = TraxsourceParser::Home.new
    end

    after do
      VCR.eject_cassette
    end

    it "creates an instance" do
      @tp.must_be_instance_of TraxsourceParser::Home
    end

    describe :top10 do
      it "must contain 10 items" do
        @tp.home[:top10].length.must_equal 10
      end
    end
end

