Rails.application.routes.default_url_options[:host] = 'localhost:3001'

Rails.application.routes.draw do

  # no login required
  scope :api, defaults: {format: :json} do
    get 'campaigns/all_campaigns', to: 'campaigns#all_campaigns'
    get 'campaigns/comments', to: 'campaigns#comments'
    get 'campaigns/:id', to: 'campaigns#show'
  end

  # login required
  namespace :api, defaults: { format: :json } do
    resources :users, only: %w[show]
    resources :campaigns do
      member do 
        get :my_campaigns
      end
    end
    resources :donations
    resources :comments
    

  end

  devise_for :users,
    defaults: { format: :json },
    path: '',
    path_names: {
      sign_in: 'api/login',
      sign_out: 'api/logout',
      registration: 'api/signup'
    },
    controllers: {
      sessions: 'sessions',
      registrations: 'registrations'
    }

end
