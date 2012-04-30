# Redmine Bulk User Assignments: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

require 'redmine'

Redmine::Plugin.register :redmine_bulk_user_assignments do
  name 'Redmine Bulk User Assignments'
  author 'Matt Hansen'
  description 'This plugin provides an interface for assigning multiple users to project(s) with specified role(s)'
  version '1.0.0'
  url ''
  author_url ''

  # permission :bulk_user_assignments, :bulk_user_assignments => :index

  menu :admin_menu, :bulk_user_assignments,
                          {:controller => 'bulk_user_assignments', :action => 'index'},
                          :caption => :redmine_bulk_user_assignments,
                          :html => { :class => 'icon roles' }

end
