class Publication
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/publications"
end
