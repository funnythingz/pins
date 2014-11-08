Rails.application.routes.draw do

  # devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'pin#stream'

  # pin
  post    '/pin(.:format)',           to: 'pin#create', as: 'create_pin'
  get     '/pin/new(.:format)',       to: 'pin#new',    as: 'new_pin'
  get     '/pin/:id/edit(.:format)',  to: 'pin#edit',   as: 'edit_pin'
  get     '/pin/:id(.:format)',       to: 'pin#show',   as: 'pin'
  put     '/pin/:id(.:format)',       to: 'pin#update'
  delete  '/pin/:id(.:format)',       to: 'pin#destroy'

  # my
  get     '/my',                      to: 'my#view',    as: 'my'

end
