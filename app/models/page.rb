class Page < ActiveResource::Base
  include FormatApiResponse
  include PubActiveResourceConfig

  has_many :images
  belongs_to :page_collection

  def self.new_with_defaults(attributes={})
    page = Page.new({
      project_id: nil,
      collection_id: nil,
      published_at: nil,
      featured_at: nil,
      featured: false,
      name: "",
      slug: "",
    }.merge(attributes))
    page
  end

  def save
    self.prefix_options[:page] = self.attributes
    super
  end

  def published?
    published_at.present?
  end

  def published_date
    DateTime.parse(published_at).in_time_zone(Rails.application.config.time_zone) if published_at.present?
  end

  def featured?
    featured_at.present?
  end

  def featured_date
    DateTime.parse(featured_at).in_time_zone(Rails.application.config.time_zone) if featured_at.present?
  end

end
