require 'test_helper'
require 'lib/traxsource_parser/shared/title_assertions'

describe TraxsourceParser::Title do
  include Minitest::Hooks

  before(:all) do
    VCR.insert_cassette 'traxsource_parser_title', record: :new_episodes
  end

  after(:all) do
    VCR.eject_cassette
  end

  describe "regular title" do
    before(:all) do
      @tp = TraxsourceParser::Title.new(785306)
      @title = @tp.title
    end

    include TitleAssertions

    it "must not be a bundle" do
      @title[:bundle].must_equal false
    end
  end

  describe "bundle" do
    before(:all) do
      @tp = TraxsourceParser::Title.new(795133)
      @title = @tp.title
    end

    include TitleAssertions

    it "must be a bundle" do
      @title[:bundle].must_equal true
    end
  end
end
