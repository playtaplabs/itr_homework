class AffiliatesController < ApplicationController
	# ----------
		
		# Allowing for the use the short form of their email to login
		before_create :create_login

	# ----------

	def new
		@affiliate = Affiliate.new
	end

	def create
		@affiliate = Affiliate.new(params[:affiliate])

		if @affiliate.save
			redirect_to @affiliate
		else
			render action: :new
		end
	end

	def create_login
		email = self.email.split(/@/)
		login_taken = Affiliate.where( :login => email[0]).first
		unless login_taken
			self.login = email[0]
		else
			self.login = self.email
		end
	end
	
	def self.find_for_database_authentication(conditions)
		self.where(:login => conditions[:email]).first || self.where(:email => conditions[:email]).first
	end	
		
	end
	def show
		@affiliate = Affiliate.find(params[:id])
	end
end
