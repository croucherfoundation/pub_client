class UpcomingEvent
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/upcoming_events"

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false

  class << self
    def reindex
      post '/api/upcoming_events/reindex'
    rescue => e
      nil
    end
  end

end
