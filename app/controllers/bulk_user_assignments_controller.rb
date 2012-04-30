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

# Bulk User Assignments Controller
#
# This controller provides a single index method, which provides an interface for easily
# assigning multiple users to multiple projects with one or more roles

class BulkUserAssignmentsController < ApplicationController
  unloadable

  before_filter :authorize_global

  # Load the interface for assigning project roles
  def index

    # Get all groups for display in the filter
    @groups = Group.find(:all)

    # Find the selected group
    if (params[:group_id] && !params[:group_id].blank?)
      @group = Group.find(params[:group_id])
    end

    @group ||= Group.new

    if !@group.new_record?
      @users = @group.users
      @projects = Project.active
      @roles = Role.givable
    end

    # Give us empty arrays if there is no group selected
    @users ||= []
    @projects ||= []
    @roles ||= []

  end

  # Handle assignment of users to projects
  def assign

    @users = params[:users]
    @projects = params[:projects]
    @roles = params[:roles]

    if @users.blank? || @projects.blank? || @roles.blank?
      # Head back to the index
      flash[:error] = l(:bulk_user_assignments_submit_error)
      redirect_to :action => 'index', :project_id => @project
      return
    end

    # Loop across projects and users, creating membership records
    @users.each do |user|
      @projects.each do |project|
        # Find the member record or create a new one
        member = Member.find(:first, :conditions => { :user_id => user, :project_id => project} )
        member ||= Member.new

        # Assign user_id and project_id if this is a new record
        member.user_id = user if member.new_record?
        member.project_id = project if member.new_record?

        # Merge exisiting role_ids with those selected on the form
        member.role_ids = (member.role_ids + @roles).uniq

        # Save the record
        member.save
      end
    end

    # Head back to the index
    flash[:notice] = l(:bulk_user_assignments_roles_assigned)
    redirect_to :action => 'index', :project_id => @project

  end

end
