class PageCollection
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/page_collections"

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false

  def self.new_with_defaults(attributes={})
    page = Page.new({
      title: "",
      slug: ""
    }.merge(attributes))
    page
  end
end
