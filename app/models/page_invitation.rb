class PageInvitation
  include Her::JsonApi::Model

  use_api PUB
  collection_path "/api/page-invitations"

  # temporary while we are not yet sending jsonapi data back to core properly
  include_root_in_json true
  parse_root_in_json false
  belongs_to :page
end