module HasPageCollection
  extend ActiveSupport::Concern

  def page_collection
    Page.find(page_id)
  end
  
  def page?
    page_id && page
  end

end