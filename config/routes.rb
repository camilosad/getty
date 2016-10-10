Rails.application.routes.draw do
  root to: 'instrutores#index'
  resources :instrutores
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
