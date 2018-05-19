Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
    
  root to: "home#index"
  get 'support', to: 'home#support'
  get 'privacy', to: 'home#privacy'

  get 'my_profile', to: 'users#my_profile'

  resources :strategies do
    collection do
      delete 'destroy_multiple'
    end
  end

  get 'selected_rule', to: 'strategies#selected_rule'
  post 'rules_for_strategy', to: 'strategies#rules_for_strategy'
  get 'display_strategy', to: 'strategies#display_strategy'
  get 'draft_strategy', to: 'strategies#draft_strategy'
  get 'display_drafted_strategy', to: 'strategies#display_drafted_strategy'
  delete 'remove_strategy_rule', to: 'strategies#remove_strategy_rule'
  delete 'discard_strategy', to: 'strategies#discard_strategy'
end
