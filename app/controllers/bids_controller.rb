class BidsController < ApplicationController
	def new
		@user=User.find_by(id: session[:user_id])
		@item=@user.items.find_by(id: params[:item_id])
		@bid=@item.bids.new

	end

	def create
		@user=User.find_by(id: session[:user_id])
		@item=@user.items.find_by(id: params[:item_id])
		@bid=@item.bids.new
		@bid.amount= params[:bid][:amount] 
		@bid.user_id=@user.id
		
		if @bid.save
			flash[:notice]="Bid added successfully"
			redirect_to controller: 'items', action: 'show', id: @item.id
		else
			redirect_to controller: 'items', action: 'show', id: @item.id
			flash[:error]="Bid could not be added"
		end
	end

	def index
		@user=User.find session[:user_id]
		@item=@user.items
	end

	def show
		@user=User.find session[:user_id]
		@item=@user.items.find params[:id]
	end

private
def bid_params
	params.require(:bid).require(:amount)
end
end