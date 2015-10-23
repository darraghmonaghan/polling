class UsersController < ApplicationController

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end


	def create
		@user = User.create(user_params)
		redirect_to users_path(@user.id)
	end


	def show
	      id = params[:id]

	      @user = User.find(params[:id])
	      # if current_user.id == @user.id
	        render :show
	      # else
	      #   redirect_to root_path
	      # end
	end

  	def edit
	      @user = User.find(params[:id])
	    if @user.id == current_user.id
	        render :edit
	    else
	      redirect_to root_path
	    end
  	end

end

#########################################

	private

	def user_params
	   params.require(:user).permit(:email, :password, :firstname, :lastname, :country, :dob)  
	end



