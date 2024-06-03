class Publication
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/publications"

  belongs_to :page_collection
  belongs_to :page

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false

  class << self
    def find_by_slug(pc_slug, slug)
      get "/api/#{pc_slug}/#{slug}"

    rescue JSON::ParserError, Her::Errors::ParseError
      nil
    end
  end

end
