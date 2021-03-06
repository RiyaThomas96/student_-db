Rails.application.routes.draw do


  resources :countries
  devise_for :user
  # resources :users
  root to: "students#index"
  resources :students
  resources :institutions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get'/register' => 'students#new'
  get'/admin' =>'admin#admin'
  get 'admin/list'=>'admin#list' ,:as => 'list'
  get'/credentials/search'=> 'credential#index', :as => 'credential_search'
  match 'admin/approve/:id' , to: 'admin#approve' , :as=> 'approve' , via: :patch
  match 'admin/reject/:id' , to: 'admin#reject'  , :as=> 'reject' , via: :patch
  
end
