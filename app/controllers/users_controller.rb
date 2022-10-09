class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :get_categories
  before_action :get_user
  before_action :get_address

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
  end

  def update
    respond_to do |format|
      if current_user.update(user_params)
        format.html {redirect_to current_user, notice: 'You successfully updated your profile.'}
      else 
        format.html { render :edit }
      end
    end
  end

  private 

  def user_params
    params.require(:user).permit(
      :username,
      :first_name,
      :last_name,
      :bio,
      :avatar,
      :phone_number
    )
  end

  def get_user
    @user = current_user
  end

  def get_address
    @address = current_user.address
  end

  def get_categories
    @categories = Category.all
  end
end
