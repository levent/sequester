class Admin < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable and :timeoutable
  # devise :database_authenticatable, :confirmable,
  ##       :recoverable, :rememberable, :trackable, :validatable
  devise :database_authenticatable,
         :rememberable, :trackable


  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation
end
