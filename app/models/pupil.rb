class Pupil < User
  belongs_to :grade
  has_many :pupil_subjects
  has_many :subjects, through: :pupil_subjects
  has_many :subject_scores, class_name: 'Subject::Score'
end