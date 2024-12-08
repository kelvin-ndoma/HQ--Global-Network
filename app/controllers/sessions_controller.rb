class SessionsController < ApplicationController
    include CurrentUserConcern
  
    def create
      # Ensure params are in the expected format (require user only)
      user_params = params.require(:user).permit(:email, :password)
      
      user = User.find_by(email: user_params[:email])&.authenticate(user_params[:password])
  
      if user
        session[:user_id] = user.id
        render json: { 
          status: :created,
          logged_in: true,
          user: user
        }
      else
        render json: { status: 401 }
      end
    end
  
    # GET /logged_in - Check if a user is logged in
    def logged_in
      if @current_user
        render json: {
          logged_in: true,
          user: @current_user
        }
      else
        render json: { logged_in: false }
      end
    end
  
    # DELETE /logout - Log out a user (destroy the session)
    def logout
      reset_session
      render json: {
        status: 200,
        logged_out: true
      }
    end
  
    def update
      if @current_user.update(user_params)
        render json: @current_user
      else
        render json: @current_user.errors, status: :unprocessable_entity
      end
    end
  
    private
  
    def user_params
      # Specify allowed parameters for user update
      params.permit(:first_name, :last_name, :email, :city, :country, :date_of_birth)
    end
  end
  