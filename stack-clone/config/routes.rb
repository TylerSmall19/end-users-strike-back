Rails.application.routes.draw do
  root 'questions#index'

  resources :questions

  get '/login'  => 'sessions#new'
  post '/login' => 'sessions#create'

  delete '/logout' => 'sessions#destroy'

  get '/users/new' => 'users#new'
  get '/users/:id' => 'users#show', as: :user
  post '/users'    => 'users#create'

  post '/questions/:id/answers' => 'answers#create', as: :answers
  get '/questions/:question_id/answers/:answer_id/edit' => 'answers#edit', as: :edit_answer
  put '/questions/quesiton_id/answers/:answer_id' => 'answers#update', as: :answer
  delete '/questions/:question_id/answers/:answer_id' => 'answers#destroy', as: :delete_answer
end
