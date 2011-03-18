Picturesque::Application.routes.draw do |map|
  resources :spot_finders

  root :to => "spots#index"

  resources :spots
  resources :paintings do
    resources :comments
  
  end
  map.connect "/ddupload", :controller => "spots", :action => "ddupload"
end
