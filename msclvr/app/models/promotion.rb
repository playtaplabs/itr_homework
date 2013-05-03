class Promotion < ActiveRecord::Base
  attr_accessible :affiliate_id, :song_id, :track_url, :slug, :short_url, :short_url2, :custom_ending

  # validates :short_url2, :uniqueness => true


  # ----- we only want to save the slug once to the database
  # if we did not do this the slug would either never save or 
  # it would regenerate every time the promotion was updated 
  
  before_create :generate_slug
  # before_update :customize_redirect_link

  # -----

  belongs_to :affiliate
  belongs_to :song
  
  

  def set_track_url
  end



  private
  @url_head = "localhost:3000/"

  def generate_slug
    self.slug = SecureRandom.hex(3)
    # redirect_link = @url_head + slug
    self.short_url = "www.msclvr.com/" + slug.to_s
  end
  
# ----- http://rails-bestpractices.com/posts/47-fetch-current-user-in-models

  # def self.current
  #   Thread.current[:promotion]
  # end

  # def self.current=(promotion)
  #   Thread.current[:promotion] = promotion
  # end

 
end
