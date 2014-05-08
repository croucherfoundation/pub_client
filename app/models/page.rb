class Page
  include PaginatedHer::Model
  belongs_to :publication

  use_api PUB
  collection_path "/api/pages"

  after_save :decache

  protected

  def decache
    $cache.flush_all if $cache
  end

end
