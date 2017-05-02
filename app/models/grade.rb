class Grade < ApplicationRecord
  has_many :pupils
  #has_one :teacher
  belongs_to :teacher

end
