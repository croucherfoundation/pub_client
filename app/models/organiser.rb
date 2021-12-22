class Organiser < ActiveResource::Base
  include FormatApiResponse
  include PubActiveResourceConfig

  belongs_to :event

end
