ActionController::Routing::Routes.draw do |map|
  map.resources :sprints, :member => { :order => :get } do |sprints|
    sprints.resources :projects, :member => { :order => :get } do |projects|
      projects.resources :product_backlog_items, :member => { :delete => :get, :order => :get } do |product_backlog_items|
        product_backlog_items.resources :sprint_backlog_items, :member => { :delete => :get }
      end
    end
  end
  
  map.resources :users
  map.resource :session
  
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  # map.connect '', :controller => "welcome"
  map.home '', :controller => 'sprints', :action => 'index'

  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
