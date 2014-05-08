Rails.application.routes.draw do

  mount PubClient::Engine => "/pub_client"
end
