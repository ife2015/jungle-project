class User < ActiveRecord::Base
  
  has_secure_password

  validates :name, presence: true
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :password, presence: true, :length => { :minimum => 5, :maximum => 40 }
  validates :password, confirmation: {case_sensitive: true }

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.strip)
    if (user && user.authenticate(password))
      return true
    else
      return nil
    end
  end 

end
