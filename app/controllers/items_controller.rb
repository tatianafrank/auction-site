class ItemsController < ApplicationController
	def new
		@user=User.find_by(id: session[:user_id])
		@item=@user.items.new
	end

	def create
		@user=User.find_by(id: session[:user_id])
		@item=@user.items.new item_params
		if @item.save
			session[:item_id] = @item.id
			flash[:notice]="Item added successfully"
			redirect_to action: 'index', id: @user.id
		else
			error="Item could not be added"
		end
	end

	def index
		@user=User.find session[:user_id]
		@item=@user.items
	end

	def show
		@user=User.find session[:user_id]
		@item=@user.items.find params[:id]
		@bid=Bid.new
		@expiration=@item.expiration
		if @item.expiration <= DateTime.now
			@winning_bid= @item.bids.last
			render 'sold'
		else
			render 'show'
		end
	end





private
	def item_params
		params.require(:item).permit(:name, :description, :starting_price, :expiration)

	end

end