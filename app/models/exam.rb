class Exam < ActiveRecord::Base
  belongs_to :season
  has_many :exams_questions
  has_many :questions, through: :exams_questions
  has_many :users, through: :exams_users
  has_many :exams_users
end
