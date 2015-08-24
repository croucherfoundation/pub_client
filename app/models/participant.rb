class Participant
  include Her::JsonApi::Model
  belongs_to :event

  use_api PUB
  collection_path "/api/participants"

end
