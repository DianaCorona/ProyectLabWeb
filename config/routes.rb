Rails.application.routes.draw do

#CRUD COLECCIONES
  get 'collections/new' => 'collections#new', as: :new_collections
  post 'collections/create' => 'collections#create'
  get 'collections/:id' => 'collections#show', as: :see_one_collections
  get 'collections/:id/editar' => 'collections#edit', as: :edit_collections
  post 'collections/:id/update' => 'collections#update', as: :update_collections
  delete 'collections/:id/borrar' => 'collections#delete', as: :delete_collections

#CRUD CONTACTO 
  get 'contacts/new' => 'contacts#new', as: :new_contacts
  post 'contacts/create' => 'contacts#create'
  get 'contacts/:id' => 'contacts#show', as: :see_one_contacts
  get 'contacts/:id/editar' => 'contacts#edit', as: :edit_contacts
  post 'contacts/:id/update' => 'contacts#update', as: :update_contacts
  delete 'contacts/:id/borrar' => 'contacts#delete', as: :delete_contacts

#CRUD EVENTOS
  get 'events/new' => 'events#new', as: :newevents
  post 'events/create' => 'events#create'
  get 'events/:id' => 'events#show', as: :see_one_events
  get 'events/:id/editar' => 'events#edit', as: :edit_events
  post 'events/:id/update' => 'events#update', as: :update_events
  delete 'events/:id/borrar' => 'events#delete', as: :delete_events

#CRUD GRUPOS
  get 'groups/new' => 'groups#new', as: :new_groups
  post 'groups/create' => 'groups#create'
  get 'groups/:id' => 'groups#show', as: :see_one_ugroups
  get 'groups/:id/editar' => 'groups#edit', as: :edit_groups
  post 'groups/:id/update' => 'groups#update', as: :update_groups
  delete 'groups/:id/borrar' => 'groups#delete', as: :delete_groups

#CRUD NOTAS
  get 'notes/new' => 'notes#new', as: :new_notes
  post 'notes/create' => 'notes#create'
  get 'notes/:id' => 'notes#show', as: :see_one_notes
  delete 'notes/:id/borrar' => 'notes#delete', as: :delete_notes

#CRUD CHAT PRIVADO
  get 'privateMConversation' => 'privateMConversation#index', as: :see_privateMConversation
  get 'privateConversation/new' => 'privateConversation#new', as: :new_privateConversation
  post 'privateConversation/create' => 'privateConversation#create'
  get 'privateConversation/:id' => 'privateConversation#show', as: :see_one_privateConversation
  get 'privateConversation/:id/editar' => 'privateConversation#edit', as: :edit_privateConversation
  post 'privateConversation/:id/update' => 'privateConversation#update', as: :update_privateConversation
  delete 'privateConversation/:id/borrar' => 'privateConversation#delete', as: :delete_privateConversation

#CR MENSAJES PRIVADO
  get 'privateMessages' => 'privateMessages#index', as: :see_privateMessages
  get 'privateMessage/new' => 'privateMessage#new', as: :new_privateMessage
  post 'privateMessage/create' => 'privateMessage#create'

#CR MENSAJES PUBLICO
  get 'publicMessages' => 'publicMessages#index', as: :see_publicMessages
  get 'publicMessage/new' => 'publicMessage#new', as: :new_publicMessage
  post 'publicMessage/create' => 'publicMessage#create'

#CRUD USUARIOS 
  #get 'users' => 'users#index', as: :see_users
  get 'users/new' => 'users#new', as: :new_user
  post 'users/create' => 'users#create'
  get 'users/:id' => 'users#show', as: :see_one_users
  get 'users/:id/editar' => 'users#edit', as: :edit_users
  post 'users/:id/update' => 'users#update', as: :update_users
  delete 'users/:id/borrar' => 'users#delete', as: :delete_users

#CR MENSAJES
  get 'messages' => 'messages#index', as: :see_messages
  get 'message/new' => 'message#new', as: :new_message
  post 'message/create' => 'message#create'



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
