Rails.application.routes.draw do
  
  root 'users#new'
 
  get 'options/new'

  get 'options/create'

  get 'options/view'

  get 'options/update'

  get 'options/destroy'

  get 'questions'=>'questions#new'
  
  post 'questions/show' => 'questions#show'
  post 'questions/ashiupdate' => 'questions#ashiupdate'
  post 'questions/ashidestroy' => 'questions#ashidestroy'
  post '/submit' => 'attempt#submitresponse'
  post 'questions/create' => 'questions#create'
  get 'output' => 'questions#index'

  get 'questions/view'

  post 'questions/update'
  
  get '/quizzes/retrieve_category' => 'quizzes#retrieve_category'
  get '/quizzes/retrieve_quiz' => 'quizzes#retrieve_quiz'
  get '/thechaostone' => 'game#thechaostone'
  get '/quotegamer' => 'game#quotegamer'
  get '/captain' => 'game#captainplanet'
  get 'questions/destroy'
  get 'users/profile_pic'
  put 'users/update'
  get 'quiz' => 'quizzes#index'
  
  get 'badges/view' => 'badges#view'
  get 'getchaos' => 'game#getstone'

  get 'admin' => 'quizzes#admin'
  get 'user' => 'quizzes#user'
  get 'user_profile' => 'users#user_profile'
  get '/games' => 'quizzes#games'
  
  get  '/attempt/index' => 'attempt#index'
  get '/attempt/retrieve' => 'attempt#retrieve1'
  get 'attempt/view' => 'attempt#view'
  
  get 'signup' => 'users#new'
  get '/questions/index' => 'questions#index'
  get '/jigsawtron' => 'game#jigsawtron'
  get '/thechaostone' => 'game#chaostone'
  resources :users
  resources :quizzes
  resources :questions
  resources :options
  resources :badges
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  post '/attempt/response' => 'attempt#quizresponse'
  post '/game/response' => 'game#quizresponse'

  delete 'logout' => 'sessions#destroy'
  get 'gameview' => 'game#view'
  get 'quiz_one' => 'game#game_one'
  get 'quizzes/destroy'
  get 'quizzes/update'
  get 'quizzes' => 'quizzes#index'

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
