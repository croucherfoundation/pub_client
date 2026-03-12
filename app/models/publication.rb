class Publication
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/publications"

  belongs_to :page_collection
  belongs_to :page

  include_root_in_json true
  parse_root_in_json false

  class << self
    def find_by_slug(pc_slug, slug, meta = false)
      url = "/api/#{pc_slug}/#{slug}"
      url += "?meta=true" if meta

      get url
    rescue JSON::ParserError, Her::Errors::ParseError
      nil
    end

    # Search publications by title within an optional page_collection.
    # Returns parsed JSON array of { title, chinese_title, url }.
    #
    #   Publication.search_by_title("funding")
    #   Publication.search_by_title("funding", page_collection_slug: "news", limit: 10)
    #
    def search_by_title(query, page_collection_slug: nil, limit: 20)
      return [] if query.blank?

      url = "/api/publications/search?q=#{ERB::Util.url_encode(query)}&limit=#{limit}"
      url += "&page_collection_slug=#{ERB::Util.url_encode(page_collection_slug)}" if page_collection_slug.present?

      get(url)
    rescue JSON::ParserError, Her::Errors::ParseError, StandardError
      []
    end
  end
end