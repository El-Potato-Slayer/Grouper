Rails.application.routes.draw do
  resources :groups
  resources :expenses
  get "external_expenses_index" => "expenses#external_expenses_index"
  devise_for :users

  get "search", :to => "expenses#index"

  root "expenses#grouped_expenses_index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
