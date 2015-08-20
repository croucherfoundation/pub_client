class Page
  include Her::JsonApi::Model
  belongs_to :publication

  use_api PUB
  collection_path "/api/pages"
end
