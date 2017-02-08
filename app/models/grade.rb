class Grade < ApplicationRecord
  has_many :pupils
  has_one :teachers
end
