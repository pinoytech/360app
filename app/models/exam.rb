class Exam < ActiveRecord::Base
  belongs_to :season
  has_many :questions, through: :exam_questions
end
