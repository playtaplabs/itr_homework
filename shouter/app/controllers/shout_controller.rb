class ShoutController < ApplicationController
  
  def new
	@shout = Shout.new
  end

  def create
		@shout = Shout.new(params[:shout])
		
		if @shout.save
			redirect_to @shout
		else
			render action: :new
		end
	end
end
