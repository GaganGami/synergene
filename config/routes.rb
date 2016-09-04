Synergene1::Application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  root "home#index"
  get '/about-us' => "home#about_us"
  get '/about-me' => "home#about_me"
  get '/services' => "home#services"
  get '/contact' => "home#contact"
  post '/contact_us' => "home#contact_us"
  get '/service' => "home#single_service"

end
