Rails.application.routes.draw do

  root to: 'questions#index'


  #### QUESTIONS ######

  get "/questions", to: 'questions#index' 

  get '/questions/new', to: 'questions#new'

  post '/questions', to: 'questions#create', as: "create_questions"

  get '/questions/:id', to: 'questions#show'

  get '/questions/:id/edit', to: 'questions#edit'

  put '/questions/:id', to: 'question#update'

  delete '/questions/:id', to: 'questions#delete'

  ##### QUESTION OPTIONS ######

  get '/options/new', to: 'question_options#new', as: 'new_question_options'

  post '/options', to: 'question_options#create', as: 'question_options'

  ##### USERS ######

  get "/users", to: 'users#index' 

  get '/users/new', to: 'users#new'

  post '/users', to: 'users#create'

  get '/users/:id', to: 'users#show', as: 'users_profile'

  get '/users/:id/edit', to: 'users#edit'

  put '/users/:id', to: 'users#update'

  delete '/users/:id', to: 'users#delete'


  ##### SESSIONS ######

  get '/sessions', to: 'sessions#new'

  post '/sessions', to: 'sessions#create'

  delete '/sessions', to: 'sessions#destroy'







end
