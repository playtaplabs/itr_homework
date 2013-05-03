class PromotionsController < ApplicationController
	
	def go
		promotion = Promotion.find_by_slug!(params[:slug])	
		redirect_to promotion.track_url

		# if Promotion.find_by_custom_ending(params[:custom_ending]).nil?
		# 	promotion = Promotion.find_by_slug(params[:slug])
		# 	redirect_to promotion.track_url
		# else 
		# 	promotion = Promotion.find_by_custom_ending(params[:custom_ending])
		# 	redirect_to promotion.track_url
		# end
	end

	def index
		@promotions = current_affiliate.promotions

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @promotions }
		end
	end

	def show
		@promotion = Promotion.find(params[:id])

		respond_to do |format|
			format.html #show.html.erb
			format.json { render json: @promotion }
		end
	end

	def new
		@promotion = current_affiliate.promotions.build
		@allsongs = Song.all

		respond_to do |format|
      		format.html # new.html.erb
      		format.json { render json: @promotion }
      	end
	end

# ----- GET /promotions/1/edit
  	def edit
    	@promotion = Promotion.find(params[:id])
    	@allsongs = Song.all
  	end

 	def create
 		@promotion = current_affiliate.promotions.build(params[:promotion])
 		@promotion.track_url = Song.find(@promotion.song_id).track_url
 		@allsongs = Song.all
 		
 		# customize_redirect_link
 		

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
