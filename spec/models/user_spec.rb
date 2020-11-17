require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it "name prescence is validated" do
      @new_user = User.new(:name => nil, :email => "ifemastero@yahoo.com", :password => "8y88868", :password_confirmation => "8y88868" )
      @new_user.valid?
      expect(@new_user.errors.full_messages).to include("Name can't be blank")
    end
  
    it "email prescence is validated" do
      @new_user = User.new(:name => "James", :email => nil, :password => "8y88868", :password_confirmation => "8y88868")
      @new_user.valid?
      expect(@new_user.errors.full_messages).to include("Email can't be blank")
    end

    it "email prescence should be unique with case sensitivity" do
      @new_user = User.new(:name => "James", :email => "Ifeolaifa5@gmail.com", :password => "8y88868", :password_confirmation => "8y88868")
      @new_user.save
      @new_user_2 = User.new(:name => "John", :email => "Ifeolaifa5@gmail.com",:password => "8y88868",:password_confirmation => "8y88868")
      
      @new_user_2.valid?
      expect(@new_user_2.errors.full_messages).to include("Email has already been taken")
    end

    it "password prescence is validated" do
      @new_user = User.new(:name => "James", :email => "ifemastero@yahoo.com", :password => nil, :password_confirmation => nil )
      @new_user.valid?
      expect(@new_user.errors.full_messages).to include("Password can't be blank")
    end

    it "password length is validated" do
      @new_user = User.new(:name => "James", :email => "ifemastero@yahoo.com", :password => "i",  :password_confirmation => "i")
      @new_user.valid?
      expect(@new_user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
    
    it "should fail if password different" do
      @new_user = User.new(:name => "James", :email => "ifemastero@yahoo.com", :password => "8y873dsfdfdsfsf2", :password_confirmation => "8y87342" )
      @new_user.valid?
      expect(@new_user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it "should authenticate to true if user exists" do
     @new_user = User.new(:name => "James", :email => "cashisking@yahoo.com", :password => "8y873dsfdfdsfsf2", :password_confirmation => "8y873dsfdfdsfsf2" )
     @new_user.save
     @auth = User.authenticate_with_credentials("cashisking@yahoo.com", "8y873dsfdfdsfsf2")
     expect(@auth).to be true
    end

    it "should authenticate to true if user enters email with spaces -> ' example@domain.com ' " do
      @new_user = User.new(:name => "Yinka Adejumo", :email => "yinka@yahoo.com", :password => "8y873dsfdfdsfsf2", :password_confirmation => "8y873dsfdfdsfsf2" )
      @new_user.save
      @auth = User.authenticate_with_credentials(" yinka@yahoo.com ", "8y873dsfdfdsfsf2")
      expect(@auth).to be true
    end

    it "should authenticate to true if user enters disregards case sensitivity: eXample@domain.COM -> EXAMPLe@DOMAIN.CoM" do
      @new_user = User.new(:name => "Yinka Adejumo", :email => "eXample@domain.COM", :password => "8y873dsfdfdsfsf2", :password_confirmation => "8y873dsfdfdsfsf2" )
      @new_user.save
      @auth = User.authenticate_with_credentials("EXAMPLe@DOMAIN.CoM", "8y873dsfdfdsfsf2")
      expect(@auth).to be true
    end


    it "should authenticate to nil if user does not exists" do
      @new_user = User.new(:name => "James", :email => "cashisking@yahoo.com", :password => "8y873", :password_confirmation => "8y873" )
      @auth = User.authenticate_with_credentials("cashisking@yahoo.com", "8y873")
      expect(@auth).to be nil
     end
  end


end
