Rails.application.routes.draw do

  mount PubClient::Engine => "/cap_client"
end
