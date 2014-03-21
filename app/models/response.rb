class Response < ActiveRecord::Base
  belongs_to :exams_user

  # validates :answer, presence: true
end
