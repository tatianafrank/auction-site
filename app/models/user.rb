class User < ActiveRecord::Base
has_many :items
has_many :bids

	def user
  		User.find(session[:email]) if session[:email].present?
	end
end
