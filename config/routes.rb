Rails.application.routes.draw do

  resources :projects do
    get :auto_suggest, on: :collection
  end
  resources :employees do
    get :auto_suggest, on: :collection
  end

end