# Redmine Assign Project Roles: redmine plugin to simplify assigning users to projects
# Copyright (C) 2012  Oregon State University

# Assign Project Roles Controller
#
# This controller provides a single index method, which provides an interface for easily
# assigning multiple users to multiple projects with one or more roles

class AssignProjectRolesController < ApplicationController
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
      flash[:notice] = l(:assign_project_roles_submit_error)
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
    flash[:notice] = l(:assign_project_roles_roles_assigned)
    redirect_to :action => 'index', :project_id => @project

  end

end
