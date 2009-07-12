ActionController::Routing::Routes.draw do |map|
  map.resources :votes
  map.homepage "/", :controller => "home", :action => "index"
end
