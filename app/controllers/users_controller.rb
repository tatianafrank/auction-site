class UsersController < ApplicationController

	def new
		@user=User.new
		render 'login' 
	end

	def create
		@user=User.create(user_params)
		if @user.save
		flash[:notice]= "User created"
		redirect_to action: 'show', id:@user.id
		else
			render 'new'
		end
	end

	def login
		@user=User.new 
		
		
	end

	def check
		@user = User.find_by(email: user_params[:email])

		if @user.present?
			session[:user_id] = @user.id
			redirect_to action: 'show', id: @user.id

		else
			@user = User.new
			@error= 'User not found'
			render 'login'
		end
	end

	def show
		@user=User.find params[:id]
		render 'user_home'
		
	end

	def index
		@user=User.find session[:user_id]
		@email=session[:email]
		render 'user_home'
	end

	private
	def user_params
		params.require(:user).permit(:email)
	end
	
end
