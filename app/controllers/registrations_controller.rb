class RegistrationsController < ApplicationController
    def create
      user = User.create!(user_params)
  
      if user.save
        # Store user ID in session to log the user in
        session[:user_id] = user.id
  
        render json: { user: user, status: :created }
      else
        render json: { error: user.errors.full_messages }, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :city, :country, :date_of_birth)
    end
  end
  