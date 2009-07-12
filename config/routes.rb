ActionController::Routing::Routes.draw do |map|
  map.homepage "/",      :controller => "home",  :action => "index"
  map.homepage "/stats", :controller => "stats", :action => "index"
  map.resources :votes
end
