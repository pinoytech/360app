class Response < ActiveRecord::Base
  belongs_to :exams_user
  belongs_to :question

  attr_accessor :answer_0, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_8, :answer_, :answer_9, :answer_10, :answer_11, :answer_12, :answer_13, :answer_14, :answer_15, :answer_16, :answer_17, :answer_18, :answer_19, :answer_20
  attr_accessor :question_0, :question_1, :question_2, :question_3, :question_4, :question_5, :question_6, :question_8, :question_, :question_9, :question_10, :question_11, :question_12, :question_13, :question_14, :question_15, :question_16, :question_17, :question_18, :question_19, :question_20

  # validates :answer, presence: true
end
