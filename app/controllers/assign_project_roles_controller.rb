# Redmine Assign Project Roles: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

# Assign Project Roles Controller
#
# This controller provides a single index method, which provides an interface for easily
# assigning multiple users to multiple projects with one or more roles

class AssignProjectRolesController < ApplicationController
  unloadable

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
      @projects = Project.find(:all, :order => 'lft')
      @roles = Role.find(:all)
    end

    # Give us empty arrays if there is no group selected
    @users ||= []
    @projects ||= []
    @roles ||= []

  end

end
