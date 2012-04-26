# Redmine Assign Project Roles: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

require 'redmine'

Redmine::Plugin.register :redmine_assign_project_roles do
  name 'Redmine Assign Project Roles'
  author 'Matt Hansen'
  description 'This plugin provides an interface for assigning multiple users to project(s) with specified role(s)'
  version '1.0.0'
  url ''
  author_url ''

  permission :assign_project_roles, :assign_project_roles => :index

  menu :admin_menu, :assign_project_roles,
                          {:controller => 'assign_project_roles', :action => 'index'},
                          :caption => :redmine_assign_project_roles,
                          :html => { :class => 'icon roles' }

end
