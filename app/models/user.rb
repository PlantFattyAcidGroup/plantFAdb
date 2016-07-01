class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable, :confirmable
  ROLES = %i[admin editor member]
  
  def is_admin?
    role == 'admin'
  end
  
  def is_editor?
    role == 'editor'
  end
  
end
