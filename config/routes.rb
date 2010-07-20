ActionController::Routing::Routes.draw do |map|
  map.resources :users
  map.resources :stories, :has_many => :votes, :collection => {:bin => :get}
  map.resource :session
  map.root :controller => "stories"
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
