class TitlesController < ApplicationController
  include Traxsource

  def index
  end

  def show
    parser = Traxsource::TitleParser.new(params['id'])
    render json: parser.title
  end
end
