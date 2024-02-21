class SessionsController < ApplicationController
	def new
		@user = User.new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "You have successfully logged in"
      		redirect_to root_path
	    else
	      flash.now[:error] = "There was something wrong with your login information"
	      render 'new'
	    end
	end

	def destroy
	  session[:user_id] = nil
	  flash[:notice] = "Logged out"
      redirect_to root_path
	end
end
