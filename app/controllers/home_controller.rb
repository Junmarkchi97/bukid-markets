class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:show]
  before_action :get_categories
  before_action :get_user_address

  def index
    @users = User.all
    @products = Product.all
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

  def get_categories
    @categories = Category.all
  end


  def get_user_address
    if current_user
      @address = current_user.address
    end
  end

end
