class Page
  include Her::JsonApi::Model

  use_api PUB_API
  collection_path "/api/pages"
  has_many :images
  belongs_to :page_collection

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false

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
