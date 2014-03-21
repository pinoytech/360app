class ExamsUser < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user
  belongs_to :ratee, foreign_key: :ratee_id, class_name: 'User'
end
