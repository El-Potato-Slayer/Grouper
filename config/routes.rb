Rails.application.routes.draw do
  resources :groups
  get 'group_expenses/new'
  get 'group_expenses/create'
  get 'group_expenses/destroy'
  resources :expenses
  get "external_expenses_index" => "expenses#external_expenses_index"
  devise_for :users

  root "expenses#grouped_expenses_index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
