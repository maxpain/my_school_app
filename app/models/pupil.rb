class Pupil < User
  belongs_to :grade
  belongs_to :parent
  has_many :pupil_subjects
  has_many :subjects, through: :pupil_subjects
  has_many :subject_scores, class_name: 'Subject::Score'
end