class Question < ActiveRecord::Base
  belongs_to :category
  has_many :exams, through: :exam_questions
end
