class Image < ActiveResource::Base
  include FormatApiResponse
  include PubActiveResourceConfig

  belongs_to :page

  def save
    self.prefix_options[:image] = self.attributes
    super
  end

end
