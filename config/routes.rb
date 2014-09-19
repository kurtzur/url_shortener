Rails.application.routes.draw do
	root to: "shortened_urls#index"
  resources :shortened_urls
end
