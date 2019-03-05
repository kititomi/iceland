Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
  }

 # :edit, :updateを追加
 resources :tweets
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'post#top'
  get 'post/map' => 'post#map'
  get 'post/information' => 'post#information'
  get 'post/spots' => 'post#spots'

  #Tweetの投稿に関するページ
#投稿ページ表示
get 'tweets/new' => 'tweets#new'
#投稿し、ホームにリダイレクト
post 'tweets/new' => 'tweets#create'
#投稿一覧
get 'tweets/index' => 'tweets#index'
end
