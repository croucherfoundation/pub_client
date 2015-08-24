class PageCollection
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/page_collections"

end
