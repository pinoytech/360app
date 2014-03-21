class Question < ActiveRecord::Base
  belongs_to :category
  has_many :exams, through: :exams_questions
  has_many :exams_questions

  MULTIPLE_CHOICE = 'Multiple Choice'
end
