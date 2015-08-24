class Image
  include Her::JsonApi::Model
  belongs_to :page

  use_api PUB
  collection_path "/api/images"

end
