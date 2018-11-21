Rails.application.routes.draw do
  devise_for :users
  get 'usagi' => 'blog#index'
end
