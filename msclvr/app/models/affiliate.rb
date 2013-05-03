class Affiliate < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

 # -----
    
    # Devise modifications to allow users to sign in using either email or username
    attr_accessor :login
  
  # ----- 

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :login, :email, :password, :password_confirmation, :remember_me, :first_name, :last_name 
 
  
  # an affiliate can only belong to one network (or no network at all)
  # an affiliate can have many songs that they are tracking
  
  belongs_to :network
  has_many :promotions
  has_many :songs, :through => :promotions

  # password and username are required 
  # password length must be between 8 and 14 characters long and must include at least one number and letter
  # username must be unique

  #username_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # ----------

    # Overriding the find_for_database_authentication method as prescribed by Devise to allow 
    # for email and username login capability
    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase } ]).first
      else
        where(conditions).first
      end      
    end
    

  
end
