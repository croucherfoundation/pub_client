class Organiser < ActiveResource::Base
  include PubFormatApiResponse
  include PubActiveResourceConfig

  belongs_to :event

end
