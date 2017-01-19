class TitlesController < ApplicationController
  include Traxsource::Parser
  def index

  end

  def show
    respond_to do |format|
      format.json {
        render json: Traxsource::Parser.title(params['id'])
      }
    end
  end
end
