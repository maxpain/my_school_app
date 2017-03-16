class Subject::Score < ApplicationRecord
  belongs_to :pupil
  belongs_to :teacher
  belongs_to :subject

  validates :value, presence: true, numericality: { greater_than: 0 }

end
