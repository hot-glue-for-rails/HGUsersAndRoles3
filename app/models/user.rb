class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :user_roles
  has_many :roles, through: :user_roles

  before_validation :check_if_missing_password!

  def check_if_missing_password!
    if encrypted_password.nil? || encrypted_password.empty?
      new_password = (0...8).map { (65 + rand(26)).chr }.join
      self.password = new_password
      self.password_confirmation = new_password
    end
  end


  def admin?
    roles.any? { |role| role.name ==  'admin' || role.name == 'superadmin' }
  end

  def superadmin?
    roles.any? { |role| role.name ==  'superadmin' }
  end
end
