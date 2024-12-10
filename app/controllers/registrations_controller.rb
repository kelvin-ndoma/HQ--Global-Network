class RegistrationsController < ApplicationController
  def create
    user = User.new(user_params)

    if user.save
      session[:user_id] = user.id
      render json: {
        status: :created,
        user: user
      }
    else
      render json: { status: 422, errors: user.errors.full_messages }
    end
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :country, :date_of_birth)
  end
end
