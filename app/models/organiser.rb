class Organiser
  include Her::JsonApi::Model
  belongs_to :event

  use_api PUB
  collection_path "/api/organisers"

end
