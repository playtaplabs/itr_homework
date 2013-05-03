class Song < ActiveRecord::Base
  attr_accessible :track_name, :artist_name, :track_url

  has_many :promotions
  has_many :affiliates, :through => :promotions
  has_many :short_urls, :through => :promotions
end
