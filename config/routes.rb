# Redmine Bulk User Assignments: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

#custom routes for redmine_bulk_user_assignments
ActionController::Routing::Routes.draw do |map|

  map.with_options :controller => 'bulk_user_assignments' do |bulk_assign_routes|
    bulk_assign_routes.connect "bulk_user_assignments", :conditions => { :method => :get }, :action => 'index'
    bulk_assign_routes.connect "bulk_user_assignments/assign", :conditions => { :method => :post }, :action => 'assign'
  end

end