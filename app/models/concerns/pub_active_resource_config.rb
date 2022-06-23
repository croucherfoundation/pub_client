module PubActiveResourceConfig
  extend ActiveSupport::Concern

  included do
    self.site                   = ENV['PUB_API_URL']
    self.prefix                 = '/api/'
    self.format                 = PubFormatApiResponse
    self.include_format_in_path = false
  end
end
