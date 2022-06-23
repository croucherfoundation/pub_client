class Participant < ActiveResource::Base
  include PubFormatApiResponse
  include PubActiveResourceConfig

  belongs_to :event

  def save
    self.prefix_options[:participant] = self.attributes
    super
  end

end
