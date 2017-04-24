class TitlesController < ApplicationController
  include Traxsource

  def index
  end

  def show
    render json: Traxsource.title(params['id'])
  end
end
