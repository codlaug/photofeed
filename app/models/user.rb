class User < ActiveRecord::Base
	attr_accessible :email, :password, :password_confirmation
 	acts_as_authentic do |c|
  end # block optional
end
