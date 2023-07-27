Rails.application.routes.draw do
  resources :todos
  post '/todos/:id/checked', to: 'todos#checked'

  root "todos#index"
end
