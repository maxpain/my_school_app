class Teacher < User
  belongs_to :grade
  has_many :subject_scores, class_name: 'Subject::Score'
end