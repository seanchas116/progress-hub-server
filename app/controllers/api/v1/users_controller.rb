class Api::V1::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    render json: @user
  end

  def for_name
    @user = User.find_by(name: params[:name])
    render json: @user
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes!(user_parameter)
    render json: @user
  end

  private

  def user_parameter
    params.require(:user).permit(:name, :email)
  end
end
