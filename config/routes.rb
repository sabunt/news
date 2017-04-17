Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

root to: 'hot_news#index'

  get '/admin', to: 'hot_news#admin'
  post '/admin', to: 'hot_news#create'

  
mount ActionCable.server => '/cable'
  
end
