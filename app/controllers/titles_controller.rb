class TitlesController < ApplicationController
  include Traxsource

  def index
  end

  def show
    traxsource_id = params['id']
    title_model = Title.find_by(traxsource_id: traxsource_id)
    if(title_model)
      title = title_model.title_hash
    else
      title = Traxsource::TitleParser.new(traxsource_id).title
      Title.create(traxsource_id: traxsource_id, title_hash: title)
    end
    render json: title
  end
end
