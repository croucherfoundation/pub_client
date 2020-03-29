class Image
  include Her::JsonApi::Model
  belongs_to :page

  use_api PUB_API
  collection_path "/api/images"

end
