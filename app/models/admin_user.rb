class AdminUser < User

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

end