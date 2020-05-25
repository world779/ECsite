Rails.application.routes.draw do
  scope module: :public do
    devise_for :end_users, controllers:{
      sessions: 'end_users/sessions',
      passwords: 'end_users/passwords',
      registrations: 'end_users/registrations'
   }
	 resources :end_users
	 resources :items
	 root  'items#top'
  end

  devise_for :admins, path: :admin, controllers:{
 	  sessions: 'admin/sessions',
  	passwords: 'admin/passwords',
  	registrations: 'admin/registrations'
  }
  get "admin/top" =>"admin#top", as: 'top_admin'
  namespace :admin do
  end
end
