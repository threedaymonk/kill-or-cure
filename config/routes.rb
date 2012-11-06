KillOrCure::Application.routes.draw do
  match "/about"       => "home#index",    :as => :homepage
  match "/stats"       => "stats#index",   :as => :stats
  match "/"            => "results#index", :as => :results
  match "/a-z/:letter" => "results#index", :as => :results
  match "/done"        => "votes#done",    :as => :done
  resources :votes
  resources :corrections
end
