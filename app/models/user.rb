class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
          :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         # :confirmable,
         :lockable, :timeoutable, :omniauthable, omniauth_providers: [:facebook]

  include DeviseIosRails::OAuth

  def self.from_omniauth(auth)
      puts auth
      where(provider: auth["provider"], uid: auth["uid"]).first_or_create do |user|
          user.provider = auth["provider"]
          user.uid = auth["uid"]
          user.username = auth["info"]["name"]
          user.email = auth["info"]["email"]
          user.password = "12345678"
      end
  end
  def self.new_with_session(params, session)
      puts "bbb"
      if session["devise.user_attributes"]
          new(session["devise.user_attributes"], without_protection: true) do |user|
              user.attributes = params
              user.valid?
          end
      else
          super
      end
  end  
end
