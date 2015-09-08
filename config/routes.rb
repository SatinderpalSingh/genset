Rails.application.routes.draw do


  get 'service_hours/index'

  get 'service_hours/show'

  get 'service_hours/create'

  get 'diesel_readings/index'

  get 'diesel_readings/show'

  get 'diesel_readings/create'

get "linegraph" => "homes#show"


  get 'accounts/index'

  get 'accounts/show'

  get 'accounts/add'

  get 'accounts/edit'

  resources :bill_tables
  resources :guard_infos    
  resources :quotation_details
  resources :sender_details
  resources :gen_avails
  resources :gen_expenses
  resources :gen_details
  resources :third_party_providers
  resources :taxes
  resources :banks
	resources :transactions
	resources :accounts
	resources :email_addresses
  resources :diesel_readings
	resources :service_hours
# => Tax Details
  get "tax_report" => "tax_report#index"
  post "tax_report" => "tax_report#index"
  post "mail_report" => "tax_report#mailReport"


#toView/ add and show trrnsactions
  get 'transactions/index'
  get 'transactions/show'
  post 'transactions/add'
  post 'transactions/create'
  # => Landing Page
  root 'welcome#index'
  # => Dashboard
  get  "dashboard"        => "client_details#dashboard"
  post "dashboard"	 => "client_details#dashboard"
  # => Profit Loss
  get "profitloss" => "gen_expenses#profit_loss"
  post "profitloss" => "gen_expenses#profit_loss"
  # => client
  get "client/:id"   => "client#index"
  post "client/:id" => "client#index"
  # => Third Party List
  get "partylist" => "gen_expenses#party_list"
  post "partylist" => "gen_expenses#party_list"
  get "party_providers" => "gen_expenses#party_providers"
  post "party_providers" => "gen_expenses#party_providers"
  post "third_party_providers/:id" => "third_party_providers#show"
  # => Client Details
  get  "client"           => "client_details#index"
  post "client"		        => "client_details#index"
  get  "clientdetails"    => "client_details#new"
  post "clientdetails"    => "client_details#new"
  get  "quotations/:id"   => "client_details#quotations"
	get  "active_generators" => "client_details#active_generators"

  # => Contract
  get "closed/client_details/:id" => "quotation_details#contractClose"
  get "opened/client_details/:id" => "quotation_details#contractOpen"
  post "closed/client_details/:id" => "quotation_details#contractClose"
  post "opened/client_details/:id" => "quotation_details#contractOpen"
  # => Sender Details
  get  "sender"           => "sender_details#index"
  post "sender"		        => "sender_details#index"
  get  "senderdetails"    => "sender_details#new"
  post "senderdetails"    => "sender_details#new"
  # => Genrator Details  
  get  "generators"       => "gen_details#index"
  get  "gendetails"       => "gen_details#new"
  post "gendetails"       => "gen_details#new"
  # => Genrator Expenses
  get  "genexpenses"      => "gen_expenses#index"
  get  "expenses"         => "gen_expenses#new" 
	post "bill"         => "gen_expenses#get_bill" 
	get	 "bill"         => "gen_expenses#get_bill" 
  post "expenses"         => "gen_expenses#new"  
	get "download" => "gen_expenses#download"
	post "download" => "gen_expenses#download"
	get "profit_loss" => "gen_expenses#profit_loss"
	post "profit_loss" => "gen_expenses#profit_loss"
  # => Quotation Viewer
  get  "quotationviewer"  => "quotation_details#index"
  get  "profitloss"     => "quotation_details#profitloss"
  # => Third Party Provider
  get  "thirdparty"       => "third_party_providers#index"
  get  "providers"        => "third_party_providers#new"
  post "providers"        => "third_party_providers#new"
  # => Email Configration
  get  "welcomemail"      => "client_details#mail"
  get  "sendpdfmail/:id"  => "quotation_details#mail"  
  get  "sendpdfmailfake/:id"  => "fake_quotations#mail"  
  get  "notice"           => "quotation_details#notice"
  get  "notice"           => "fake_quotations#notice"
  # => Gen_Avails
  get  "availableGenerators"     => "gen_avails#new"
  post "availableGenerators"     => "gen_avails#new"
  # => Quotation approved
  get  "/approved/quotation_details/:id" => "quotation_details#approve"
  post "/approved/quotation_details/:id" => "quotation_details#approve"

  devise_for :users
    as :user do
      get 'login'               => 'devise/sessions#new'
      post 'login'              => 'devise/sessions#create'
      get 'logout'              => 'devise/sessions#destroy'
      get 'register'            => 'devise/registrations#new'
      get 'registered'          => 'devise/registrations#show'
      get 'passwordReset'       => 'devise/passwords#new'
      get 'changePassword'      => 'devise/passwords#edit'  
      get 'resendConfirmation'  => 'devise/confirmations#new'    
    end

  mount Mercury::Engine => '/'

  resources :client_details do
    member { post :clientUpdate }
  end

  resources :fake_quotations do
    member { post :mercury_update}
  end

  namespace :mercury do
    resources :images
  end
 
  get "*path" => "quotation_details#notfound"      
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
