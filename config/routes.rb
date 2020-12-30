Rails.application.routes.draw do
  resources :countries
  devise_for :user 
  resources :users,except: [:new_registration_path]
  root to: "students#index"
  resources :students
  resources :institutions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get'/register' => 'students#new'
  get'/admin' =>'admin#admin'
  get 'admin/approve'=>'admin#approve' ,:as => 'approve'
end
