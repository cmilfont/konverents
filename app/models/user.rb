class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.find_for_facebook_oauth(email_from_facebook, signed_in_resource=nil)
        
    unless user = User.find_by_email( email_from_facebook )
      user = User.new(:email => email_from_facebook,
                      :password => Devise.friendly_token[0,20])
      user.skip_confirmation! 
      user.save           
    end
    
    user

  end
  
end
