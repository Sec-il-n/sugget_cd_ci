class UsersController < ApplicationController
  def show
    @user = User.find_by(id: params[:id])
    @participants = @user.participants
  end
end
