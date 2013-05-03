
# ----- this file needs to be edited as it was coped from promotions_controller.rb


class SongsController < ApplicationController
	def index
		@songs = current_affiliate.songs

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @songs }
		end
	end

	def show
		@song = Song.find(params[:id])

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @song }
		end
	end

	def new
		@song = current_affiliate.songs.build
		@allsongs = Song.all

		respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @song }
      	end
	end

# ----- GET /songs/1/edit
  	def edit
    	@promotion = Promotion.find(params[:id])
  	end

 	def create
 		@promotion = current_affiliate.promotions.build(params[:promotion])

 		if @promotion.save
 			redirect_to @promotion, notice: 'Promotion was successfully created.'
        	#format.json { render json: @link, status: :created, location: @link }
      	else
        	render action: "new" 
        	#format.json { render json: @link.errors, status: :unprocessable_entity }
      	end
 	end

 	def update
 		@promotion = Promotion.find(params[:id])

 		if @promotion.update_attributes(params[:promotion])
 			redirect_to @promotion, notice: 'Promotion was successfully updated.'
 		else
 			render action: "edit"
 		end
 	end

 	def destroy
 		@promotion = Promotion.find(params[:id])
 		@promotion.destroy

 		respond_to do |format|
      		format.html { redirect_to promotions_url }
      		format.json { head :no_content }
 		end
 	end
end
