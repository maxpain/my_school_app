class PupilSubject < ApplicationRecord
  belongs_to :pupil
  belongs_to :subject
end

