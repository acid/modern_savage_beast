ActionController::Routing::Routes.draw do |map|
  map.forums '/forums', :controller => 'forums/forums', :action => :index
  map.namespace :forums do |forum|
    forum.resources :posts, :name_prefix => 'all_', :collection => { :search => :get }
  	forum.resources :forums, :topics, :posts, :monitorship
  
    %w(forum).each do |attr|
      forum.resources :posts, :name_prefix => "#{attr}_", :path_prefix => "/#{attr.pluralize}/:#{attr}_id"
    end
    
    forum.resources :forums do |forum|
      forum.resources :topics do |topic|
        topic.resources :posts
        topic.resource :monitorship, :controller => :monitorships
      end
    end
  end

end
