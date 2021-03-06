
require 'api_version_constraint'


Rails.application.routes.draw do
  devise_for :users, controllers: {sessions: "api/v1/sessions"}
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
    namespace :api, defaults: {format: :json} do
       namespace :v1, path: "/", constraints: ApiVersionConstraint.new(version: 1, default: true) do
            resources :users
            resources :sessions
    end
    end
end
