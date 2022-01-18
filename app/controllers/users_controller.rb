class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
    @user.address
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      @user.address.new unless @user.address.any?
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @User.destroy

    redirect_to root_path
  end

  private
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, address_attributes:[:town, :city, :tehsil, :district, :state, :pin])
    end
end
