Rails.application.routes.draw do
  get '/' => 'site#home'

resources :users do
   resources :items 
     end
   resources :items do
resources :bids, only: [:create, :new, :index, :show]
end

  get '/login' => 'users#login'

  post '/authenticate' => 'users#check', as: :authenticate



end
# #       Prefix Verb   URI Pattern                              Controller#Action
#                GET    /                                        site#home
#     user_items GET    /users/:user_id/items(.:format)          items#index
#                POST   /users/:user_id/items(.:format)          items#create
#  new_user_item GET    /users/:user_id/items/new(.:format)      items#new
# edit_user_item GET    /users/:user_id/items/:id/edit(.:format) items#edit
#      user_item GET    /users/:user_id/items/:id(.:format)      items#show
#                PATCH  /users/:user_id/items/:id(.:format)      items#update
#                PUT    /users/:user_id/items/:id(.:format)      items#update
#                DELETE /users/:user_id/items/:id(.:format)      items#destroy
#          users GET    /users(.:format)                         users#index
#                POST   /users(.:format)                         users#create
#       new_user GET    /users/new(.:format)                     users#new
#      edit_user GET    /users/:id/edit(.:format)                users#edit
#           user GET    /users/:id(.:format)                     users#show
#                PATCH  /users/:id(.:format)                     users#update
#                PUT    /users/:id(.:format)                     users#update
#                DELETE /users/:id(.:format)                     users#destroy
#      item_bids GET    /items/:item_id/bids(.:format)           bids#index
#                POST   /items/:item_id/bids(.:format)           bids#create
#   new_item_bid GET    /items/:item_id/bids/new(.:format)       bids#new
#       item_bid GET    /items/:item_id/bids/:id(.:format)       bids#show
#          items GET    /items(.:format)                         items#index
#                POST   /items(.:format)                         items#create
#       new_item GET    /items/new(.:format)                     items#new
#      edit_item GET    /items/:id/edit(.:format)                items#edit
#           item GET    /items/:id(.:format)                     items#show
#                PATCH  /items/:id(.:format)                     items#update
#                PUT    /items/:id(.:format)                     items#update
#                DELETE /items/:id(.:format)                     items#destroy
#          login GET    /login(.:format)                         users#login
#   authenticate POST   /authenticate(.:format)                  users#check


