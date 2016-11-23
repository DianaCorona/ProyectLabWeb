Rails.application.routes.draw do
  resources :chats
  resources :messages
  get 'groups/show'

#Login
  root to: "home#index"
  devise_for :user2, controllers: { sessions: 'sessions' }

#CRUD COLECCIONES
  get 'collections/new' => 'collections#new', as: :new_collections
  post 'collections/create' => 'collections#create'
  get 'collections/:id' => 'collections#show', as: :see_one_collections
  get 'collections/:id/editar' => 'collections#edit', as: :edit_collections
  post 'collections/:id/update' => 'collections#update', as: :update_collections
  delete 'collections/:id/borrar' => 'collections#delete', as: :delete_collections

#CRUD EVENTOS
  get 'events/new' => 'events#new', as: :newevents
  post 'events/create' => 'events#create'
  get 'events/:id' => 'events#show', as: :see_one_events
  get 'events/:id/editar' => 'events#edit', as: :edit_events
  post 'events/:id/update' => 'events#update', as: :update_events
  delete 'events/:id/borrar' => 'events#delete', as: :delete_events

#CRUD GRUPOS
  get 'groups' => 'groups#index', as: :all_groups
  get 'groups/new' => 'groups#new', as: :new_groups
  post 'groups/create' => 'groups#create'
  get 'groups/:id' => 'groups#show', as: :see_one_ugroups
  get 'groups/:id/editar' => 'groups#edit', as: :edit_groups
  post 'groups/:id/update' => 'groups#update', as: :update_groups
  delete 'groups/:id/borrar' => 'groups#delete', as: :delete_groups

  #CRUD GRUPOS-LISTA

  get 'group_list/:id' => 'group_list#show'

#CRUD NOTAS
  get 'notes' => 'notes#index', as: :all_notes
  get 'notes/new' => 'notes#new', as: :new_notes
  post 'notes/create' => 'notes#create', as: :create_notes
  get 'notes/:id' => 'notes#show', as: :see_one_notes
  delete 'notes/:id/borrar' => 'notes#delete', as: :delete_notes

#CRUD CHAT PRIVADO
  get 'private_Conversations' => 'private_conversation#index', as: :see_privateConversation
  get 'private_Conversations/new' => 'private_conversation#new', as: :new_privateConversation
  post 'private_Conversations/create' => 'private_conversation#create'
  get 'private_Conversations/:id' => 'private_conversation#show', as: :see_one_privateConversation
  get 'private_Conversations/:id/editar' => 'private_conversation#edit', as: :edit_privateConversation
  post 'private_Conversations/:id/update' => 'private_conversation#update', as: :update_privateConversation
  delete 'private_Conversations/:id/borrar' => 'private_conversation#delete', as: :delete_privateConversation

#CR MENSAJES PRIVADO
  get 'private_Messages' => 'private_messages#index', as: :see_privateMessages
  get 'private_Message/new' => 'private_message#new', as: :new_privateMessage
  post 'private_Message/create' => 'private_message#create'

#CR MENSAJES PUBLICO
  get 'public_Messages' => 'public_messages#index', as: :see_publicMessages
  get 'public_Message/new' => 'public_message#new', as: :new_publicMessage
  post 'public_Message/create' => 'public_message#create'

#CRUD USUARIOS

  get 'users' => 'users2#index', as: :see_users
  get 'users/new' => 'users2#new', as: :new_user
  post 'users/create' => 'users2#create'
  get 'users/:id' => 'users2#show', as: :see_one_users
  get 'users/:id/editar' => 'users2#edit', as: :edit_users


  put 'users/:id/update' => 'users2#update', as: :update_users

  delete 'users/:id/borrar' => 'users2#delete', as: :delete_users

#CR MENSAJES
  # get 'messages' => 'messages#index', as: :see_messages
  # get 'message/new' => 'message#new', as: :new_message
  # post 'message/create' => 'message#create'



  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
