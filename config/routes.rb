# Redmine Bulk User Assignment: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

#custom routes for redmine_assign_project_roles
ActionController::Routing::Routes.draw do |map|

  map.with_options :controller => 'bulk_user_assignment' do |bukl_assign_routes|
    bulk_assign_routes.connect "bulk_user_assignment", :conditions => { :method => :get }, :action => 'index'
    bulk_assign_routes.connect "bulk_user_assignment/assign", :conditions => { :method => :post }, :action => 'assign'
  end

end