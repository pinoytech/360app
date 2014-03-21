class Response < ActiveRecord::Base
  belongs_to :exams_user

  attr_accessor :answer_0, :answer_1, :answer_2, :answer_3, :answer_4, :answer_5, :answer_6, :answer_8, :answer_, :answer_9, :answer_10, :answer_11, :answer_12, :answer_13, :answer_14, :answer_15, :answer_16, :answer_17, :answer_18, :answer_19, :answer_20

  # validates :answer, presence: true
end
