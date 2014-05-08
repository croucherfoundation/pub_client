class Organiser
  include PaginatedHer::Model
  belongs_to :event

  use_api PUB
  collection_path "/api/organisers"

  after_save :decache

  def datetime
    DateTime.parse(date) if date?
  end

  protected

  def decache
    $cache.flush_all if $cache
  end

end
