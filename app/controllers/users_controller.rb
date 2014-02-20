class UsersController < ApplicationController
 	def new
		@user = User.new  
  	end
  	def index
    	@users = User.all
  	end
  	def login
  		@user = User.new
  	end

  	def create
    	@user = User.add(params[:name], params[:password])
    	if @user.save
      		flash[:success] = "User successfully registered!"
      		redirect_to @user
    	else
      		render 'new'
    	end
  	end

    def user_params
      params.require(:user).permit(:name, :password)
  	end 

end
