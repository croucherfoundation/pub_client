class Event
  include Her::JsonApi::Model
  include HasGrant
  has_many :organisers
  has_many :participants
  has_many :images
  has_many :days

  use_api PUB
  collection_path "/api/events"

  after_save :decache

  def datetime
    DateTime.parse(date) if date?
  end
  
  def organised_by?(user)
    organisers.map(&:user_uid).include?(user.uid)
  end

  def participated_in_by?(user)
    participants.map(&:user_uid).include?(user.uid)
  end

  protected

  def decache
    $cache.flush_all if $cache
  end

end
