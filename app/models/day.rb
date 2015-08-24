class Day
  include Her::JsonApi::Model
  belongs_to :event

  use_api PUB
  collection_path "/api/days"

  def datetime
    DateTime.parse(date) if date?
  end
  
  def time
    datetime.time_of_day if datetime?
  end

end
