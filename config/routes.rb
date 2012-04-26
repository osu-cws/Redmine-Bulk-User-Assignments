# Redmine Assign Project Roles: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

#custom routes for redmine_assign_project_roles
ActionController::Routing::Routes.draw do |map|

  map.with_options :controller => 'assign_project_roles' do |assign_routes|
    assign_routes.connect "assign_project_roles", :conditions => { :method => :get }, :action => 'index'
  end

end