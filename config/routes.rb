ActionController::Routing::Routes.draw do |map|
  map.homepage   "/about",   :controller => "home",    :action => "index"
  map.stats      "/stats",   :controller => "stats",   :action => "index"
  map.results    "/",        :controller => "results", :action => "index"
  map.done       "/done",    :controller => "votes",   :action => "done"
  map.resources :votes
  map.resources :corrections
end
