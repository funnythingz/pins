Rails.application.routes.draw do

  root 'pingo#stream', as: 'pingo_stream'

  # pingo
  get '/pingo(.:format)', to: 'pingo#index', as: 'pingo_index'
  post '/pingo(.:format)', to: 'pingo#create'
  get '/pingo/new(.:format)', to: 'pingo#new', as: 'new_pingo'
  get '/pingo/:id/edit(.:format)', to: 'pingo#edit', as: 'edit_pingo'
  get '/pingo/:id(.:format)', to: 'pingo#show', as: 'pingo'
  patch '/pingo/:id(.:format)', to: 'pingo#update'
  delete '/pingo/:id(.:format)', to: 'pingo#destroy'

end
