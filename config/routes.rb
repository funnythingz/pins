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
  post    '/pin(.:format)',           to: 'pin#create',       as: 'create_pin'
  get     '/pin/new(.:format)',       to: 'pin#new',          as: 'new_pin'
  get     '/pin/:id(.:format)',       to: 'pin#view',         as: 'pin'
  get     '/pin/:id/favorites',       to: 'pin#favorites',    as: 'pin_favorites'
  get     '/pin/:id/edit',            to: 'pin#edit',         as: 'edit_pin'
  put     '/pin/:id(.:format)',       to: 'pin#update',       as: 'update_pin'
  delete  '/pin/:id(.:format)',       to: 'pin#destroy',      as: 'destroy_pin'
  post    '/pin/favorite(.:format)',  to: 'pin#put_favorite', as: 'put_favorite'

  # TODO: boards

  # my
  get     '/my',                        to: 'my#my',              as: 'my'
  get     '/my/favorites',              to: 'my#favorites',       as: 'my_favorites'
  get     '/my/profile',                to: 'my#profile',         as: 'profile'
  get     '/my/profile/edit_user',      to: 'my#edit_user',       as: 'edit_user'
  put     '/my/profile/update_user',    to: 'my#update_user',     as: 'update_user'
  get     '/my/profile/edit_profile',   to: 'my#edit_profile',    as: 'edit_profile'
  put     '/my/profile/update_profile', to: 'my#update_profile',  as: 'update_profile'

  # member
  get     '/member/:id',              to: 'member#member',    as: 'member'
  get     '/member/:id/favorites',    to: 'member#favorites', as: 'member_favorites'

end
