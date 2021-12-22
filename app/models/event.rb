class Event < ActiveResource::Base
  include FormatApiResponse
  include PubActiveResourceConfig

  has_many :organisers
  has_many :participants
  has_many :images
  has_many :days

  def datetime
    DateTime.parse(date) if date?
  end

  def organised_by?(user)
    organisers.map(&:user_uid).include?(user.uid)
  end

  def participated_in_by?(user)
    participants.map(&:user_uid).include?(user.uid)
  end

  def save
    self.prefix_options[:event] = self.attributes
    super
  end

end
