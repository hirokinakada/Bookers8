Rails.application.routes.draw do
	root 'home#top'
		get 'home/about'
	resources :books do
	resource :favorites, only: [:create, :destroy]
	resource :book_comments,only: [:create, :destroy]
end

	devise_for :users 
	resources :users,only: [:show,:index,:edit,:update] do

get 'relationships/follows'
get 'relationships/followers'
end

post 'follow/:id' => 'relationships#follow', as: 'follow' # フォローする
post 'unfollow/:id' => 'relationships#unfollow', as: 'unfollow' # フォロー外す

get "search" => "search#search"





end
