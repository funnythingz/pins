Rails.application.routes.draw do

  # devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }
  devise_scope :user do
    get "/login", to: "devise/sessions#new"
    get "/logout", to: "devise/sessions#destroy"
  end

  root 'pin#stream'

  # pin
  post    '/pin(.:format)',           to: 'pin#create',   as: 'create_pin'
  get     '/pin/new(.:format)',       to: 'pin#new',      as: 'new_pin'
  get     '/pin/:id(.:format)',       to: 'pin#view',     as: 'pin'
  get     '/pin/:id/edit',            to: 'pin#edit',     as: 'edit_pin'
  put     '/pin/:id(.:format)',       to: 'pin#update',   as: 'update_pin'
  delete  '/pin/:id(.:format)',       to: 'pin#destroy',  as: 'destroy_pin'

  # my
  get     '/my',                      to: 'my#view',      as: 'my'

  # member
  get     '/member/:id',                  to: 'member#view',  as: 'member'

end
