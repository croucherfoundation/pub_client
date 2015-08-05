class Image
  include Her::JsonApi::Model
  belongs_to :page

  use_api PUB
  collection_path "/api/images"

  after_save :decache

  protected

  def decache
    $cache.flush_all if $cache
  end

end
