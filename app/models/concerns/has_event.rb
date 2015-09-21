module HasEvent
  extend ActiveSupport::Concern

  def event
    Event.find(event_id)
  end
  
  def event?
    event_id && event
  end

end