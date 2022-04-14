class SessionsController < ApplicationController
    def new 
    end

    def create
        p params
        user = User.find_by(email: params[:email])
        p user
        p "AUTHENTICATE ---------------------"
        p user.authenticate(params[:password])
        if user.present? && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect_to  root_path, notice: "Logged in successfully"
        else
            flash[:alert] = "Invalid Email or Password"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logout"
    end
end