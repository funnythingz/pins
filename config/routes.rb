Rails.application.routes.draw do

  # devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'pin#stream'

  # pin
  get     '/pin(.:format)',           to: 'pin#index',  as: 'pins'
  post    '/pin(.:format)',           to: 'pin#create'
  get     '/pin/new(.:format)',       to: 'pin#new',    as: 'new_pin'
  get     '/pin/:id/edit(.:format)',  to: 'pin#edit',   as: 'edit_pin'
  get     '/pin/:id(.:format)',       to: 'pin#show',   as: 'pin'
  patch   '/pin/:id(.:format)',       to: 'pin#update'
  delete  '/pin/:id(.:format)',       to: 'pin#destroy'

end