class SiteController < ApplicationController
	def home
		@user=User.new
		render 'home'
	end

end
