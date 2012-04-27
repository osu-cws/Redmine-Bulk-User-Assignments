# Redmine Bulk User Assignment: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

require 'redmine'

Redmine::Plugin.register :redmine_bulk_user_assignment do
  name 'Redmine Bulk User Assignment'
  author 'Matt Hansen'
  description 'This plugin provides an interface for assigning multiple users to project(s) with specified role(s)'
  version '1.0.0'
  url ''
  author_url ''

  permission :bulk_user_assignment, :bulk_user_assignment => :index

  menu :admin_menu, :bulk_user_assignment,
                          {:controller => 'bulk_user_assignment', :action => 'index'},
                          :caption => :redmine_bulk_user_assignment,
                          :html => { :class => 'icon roles' }

end
