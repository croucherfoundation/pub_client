class Event
  include PaginatedHer::Model
  include HasGrant

  use_api PUB
  collection_path "/api/events"

  after_save :decache

  def datetime
    DateTime.parse(date) if date?
  end

  protected

  def decache
    $cache.flush_all if $cache
  end

end
