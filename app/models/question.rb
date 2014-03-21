class Question < ActiveRecord::Base
  belongs_to :category
  has_many :exams_questions
  has_many :exams, through: :exams_questions

  self.inheritance_column = :fake_column
end
