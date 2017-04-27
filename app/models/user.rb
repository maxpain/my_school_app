class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable,
  		 :rememberable, :trackable, :validatable

  enum role: [:user, :admin]
  enum gender: [:male, :female]

  before_create :set_role
  before_create :set_geder

  def set_role
    self.role = :user
  end

  def set_gender
    self.gender = :male
  end


end
