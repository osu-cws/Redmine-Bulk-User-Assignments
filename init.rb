# Redmine Bulk User Assignments: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see http://www.gnu.org/licenses/.
#
# To contact us, go to http://oregonstate.edu/cws/contact and fill out the contact form.
#
# Alternatively mail us at:
#
# Oregon State University
# Central Web Services
# 121 The Valley Library
# Corvallis, OR 97331

require 'redmine'

Redmine::Plugin.register :redmine_bulk_user_assignments do
  name 'Redmine Bulk User Assignments'
  author 'Matt Hansen'
  description 'This plugin provides an interface for assigning multiple users to project(s) with specified role(s)'
  version '0.1.0'
  url ''
  author_url ''

  # permission :bulk_user_assignments, :bulk_user_assignments => :index

  menu :admin_menu, :bulk_user_assignments,
                          {:controller => 'bulk_user_assignments', :action => 'index'},
                          :caption => :redmine_bulk_user_assignments,
                          :html => { :class => 'icon roles' }

end
