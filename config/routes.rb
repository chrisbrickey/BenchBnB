Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'static_pages#root'

  #USING API CONTROLLERS INSTEAD
  # resource :session
  # resources :users

  #makes API resoponses render json by default
  namespace :api, defaults: {format: :json} do
    #solutions use a singular route for users but convention is plural (this is a design choice, will always find controller - singular/plural only affects what shows in API)
    #solution mistakenly puts show action on session instead of users controller
    resources :users, only: [:create, :show, :destroy]
    resource :session, only: [:create, :destroy]
  end

end
