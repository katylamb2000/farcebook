Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "static_pages#root"

  namespace :api, default: { format: :json } do
    resources :users, only: [:index, :show, :create, :update] do
      post '/add_friend', to: 'friendships#request_friendship'
      patch '/accept_request', to: 'friendships#accept_friendship'
      delete '/reject_request', to: 'friendships#reject_friendship'
    end
    resource :session, only: [:create, :destroy]
    resources :posts, only: [:index, :create, :update, :destroy] do
      get '/:id/like', to: 'likes#like_post'
      get '/:id/unlike', to: 'likes#unlike_post'
    end
    resources :comments, only: [:create, :update, :destroy] do
      get '/:id/like', to: 'likes#like_comment'
      get '/:id/unlike', to: 'likes#unlike_comment'
    end
    get '/friends', to: 'friendships#friends'
    get '/friend-requests', to: 'friendships#pending_requests'
    get '/feed', to: 'posts#feed'
  end
end
