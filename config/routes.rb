Rails.application.routes.draw do
  resources :todos
  root "todos#index"
  post '/todos/:id/checked', to: 'todos#checked'
end
