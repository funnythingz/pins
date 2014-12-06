Rails.application.routes.draw do

  # devise
  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: {
                       sessions:      'users/sessions',
                       registrations: 'users/registrations'
                   }
  devise_scope :user do
    get "/login",   to: "users/sessions#new"
    get "/logout",  to: "users/sessions#destroy"
  end

  root 'pin#stream'

  # pin
  post    '/pin(.:format)',           to: 'pin#create',     as: 'create_pin'
  get     '/pin/new(.:format)',       to: 'pin#new',        as: 'new_pin'
  get     '/pin/:id(.:format)',       to: 'pin#view',       as: 'pin'
  get     '/pin/:id/favorites',       to: 'pin#favorites',  as: 'pin_favorites'
  get     '/pin/:id/edit',            to: 'pin#edit',       as: 'edit_pin'
  put     '/pin/:id(.:format)',       to: 'pin#update',     as: 'update_pin'
  delete  '/pin/:id(.:format)',       to: 'pin#destroy',    as: 'destroy_pin'

  # my
  get     '/my',                      to: 'my#my',        as: 'my'
  get     '/my/favorites',            to: 'my#favorites', as: 'my_favorites'

  # member
  get     '/member/:id',              to: 'member#member',  as: 'member'

end
