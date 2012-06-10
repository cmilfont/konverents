class User < ActiveRecord::Base
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    require 'open-uri'
    data = access_token['extra']['raw_info']
    logger.debug "Facebook User data: #{data.inspect}"
    
    unless user = User.find_by_email(data['email'])
      user = User.new(:email => data['email'],
                      :password => Devise.friendly_token[0,20])
      user.skip_confirmation! 
      user.save           
    end
    
    user

  end
  
end
