class Title
  include Mongoid::Document

  field :traxsource_id, type: Integer
  field :title_hash, type: Hash

  index({ traxsource_id: 1 }, { unique: true, name: "traxsource_id_index" })
end
