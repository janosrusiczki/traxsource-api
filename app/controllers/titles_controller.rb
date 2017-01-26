class TitlesController < ApplicationController
  include Traxsource
  def index

  end

  def show
    respond_to do |format|
      format.json {
        render json: Traxsource.title(params['id'])
      }
    end
  end
end
