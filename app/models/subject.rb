class Subject < ApplicationRecord
  has_many :pupil_subjects
  has_many :pupils, through: :pupil_subjects
  has_many :subject_scores, class_name: 'Subject::Score'
end
