Rails.application.routes.draw do
  root to: 'questions#index'
  # resources :questions do
  #   resources :comments, except: [:show, :index]
  #   resources :votes, except: [:show, :edit, :index, :new]
  #   resources :answers, except: [:new, :show, :index]
  # end
  resources :answers do
    resources :comments, except: [:show, :index]
    resources :votes, except: [:show, :edit, :index, :new]
  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  get '/questions' => 'questions#index'
  get '/questions/:id' => 'questions#show', as: "question_path"
  get '/questions/new' => 'questions#new'
  get '/questions/:id/edit' => 'questions#edit'
  post '/questions' => 'questions#create'
  patch '/questions' => 'questions#update'
  delete '/questions/:id' => 'questions#destroy'

  get '/users/new' => 'users#new'
  get '/users/:id' => 'users#show'
  post '/users' => 'users#create'

  get '/sessions/new' => 'sessions#new'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy'
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
