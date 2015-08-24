class Page
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/pages"

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false

  def self.new_with_defaults(attributes={})
    page = Page.new({
      project_id: nil,
      collection_id: nil,
      name: "",
      slug: "",
    }.merge(attributes))
    page
  end

end
