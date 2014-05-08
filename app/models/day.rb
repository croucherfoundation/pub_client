class Day
  include PaginatedHer::Model
  belongs_to :event

  use_api PUB
  collection_path "/api/days"

  after_save :decache

  def datetime
    DateTime.parse(date) if date?
  end
  
  def time
    datetime.time_of_day if datetime?
  end

  protected

  def decache
    $cache.flush_all if $cache
  end

end
