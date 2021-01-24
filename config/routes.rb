Rails.application.routes.draw do
  get 'group_expenses/new'
  get 'group_expenses/create'
  get 'group_expenses/destroy'
  resources :groups
  resources :expenses
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
