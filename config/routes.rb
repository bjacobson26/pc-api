Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'home#index'

  namespace :api do
    namespace :v1 do

      resources :users, only: [:index, :show, :update ]
      match '/users/:id/votes', to: 'users#votes', via: :get

      get '/bills', to: 'bills#index'

      match '/bills/upvote', to: 'bills#upvote_bill', via: :post
      match '/bills/downvote', to: 'bills#downvote_bill', via: :post

      match '/bills/:bill_identifier/votes', to: 'bills#votes', via: :get
      match '/bills/:bill_identifier', to: 'bills#find', via: :get
      match '/bills/:bill_identifier/upvotes', to: 'bills#upvotes', via: :get
      match '/bills/:bill_identifier/downvotes', to: 'bills#downvotes', via: :get

    end
  end

end
