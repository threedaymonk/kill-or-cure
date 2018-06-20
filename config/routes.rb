KillOrCure::Application.routes.draw do
  get "/about"       => "home#index",    :as => :homepage
  get "/stats"       => "stats#index",   :as => :stats
  get "/"            => "results#index"
  get "/a-z/:letter" => "results#index", :as => :results
  get "/done"        => "votes#done",    :as => :done
  resources :votes
  resources :corrections
end
