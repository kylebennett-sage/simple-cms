class AdminUsersController < ApplicationController
  layout "admin"

  before_action :confirm_logged_in

  def index
    @users = AdminUser.sorted
  end

  def new
    @user = AdminUser.new
  end

  def create
    @user = AdminUser.new(user_params)

    if @user.save
      flash[:notice] = "User '#{@user.name} - #{@user.username}' created successfully."
      redirect_to(admin_users_path)
    else
      render("new")
    end
  end

  def edit
    @user = AdminUser.find_by_id(params[:id])
  end

  def update
    @user = AdminUser.find_by_id(params[:id])

    if @user.update_attributes(user_params)
      flash[:notice] = "User '#{@user.name} - #{@user.username}' updated successfully."
      redirect_to(admin_users_path)
    else
      render("edit")
    end
  end

  def delete
    @user = AdminUser.find_by_id(params[:id])
  end

  def destroy
    user = AdminUser.find_by_id(params[:id]).destroy
    flash[:notice] = "User '#{user.username}' destroyed successfully."
    redirect_to(admin_users_path)
  end

  private

  def user_params
    params.require(:admin_user).permit(:first_name, :last_name, :email, :username, :password)
  end

end
