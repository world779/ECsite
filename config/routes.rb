Rails.application.routes.draw do
  scope module: :public do
    devise_for :end_users, controllers:{
      sessions: 'end_users/sessions',
      passwords: 'end_users/passwords',
      registrations: 'end_users/registrations'
   }

	 resources :items, only: [:index, :show]
   root  'items#top'

   get "mypage" => "end_users#show", as: 'end_user'
   get "mypage/edit" => "end_users#edit", as: 'edit_end_user'
   patch "mypage" => "end_users#update", as: 'update_end_user'
   get "mypage/destroy" => "end_users#confirm", as: 'withdraw_confirm_end_user'
	 patch "mypage/destroy" => "end_users#withdraw", as: 'withdraw_end_user'
   
   resources :cart_items, only: [:index, :update, :destroy, :create], path: "mypage/cart_items"

   delete "mypage/cart_items" => "cart_items#destroy_all", as: "destroy_all_cart_items"
  end


  devise_for :admins, path: :admin, controllers:{
 	  sessions: 'admin/sessions',
  	passwords: 'admin/passwords',
  	registrations: 'admin/registrations'
  }

  get "admin/top" =>"admin#top", as: 'top_admin'

  namespace :admin do
    resources :end_users
    resources :items
    resources :genres
  end
end
