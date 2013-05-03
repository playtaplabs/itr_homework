class DashboardsController < ApplicationController
	def index
		@dashboard = current_affiliate.promotions

		respond_to do |format|
      		format.html # index.html.erb
      		format.json { render json: @promotions }
	end
end
