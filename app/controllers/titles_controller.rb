class TitlesController < ApplicationController
  include TraxsourceParser

  def index
  end

  def show
    traxsource_id = params['id']
    title_model = ::Title.find(traxsource_id)
    if(title_model)
      title = title_model.hashed
    else
      title = TraxsourceParser.title(traxsource_id)
      ::Title.create(_id: traxsource_id, hashed: title)
    end
    render json: title
  end
end
