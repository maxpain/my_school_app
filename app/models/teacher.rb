class Teacher < User
  #belongs_to :grade
  has_one :grade
  has_many :subject_scores, class_name: 'Subject::Score'
  has_many :orders
end