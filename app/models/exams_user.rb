class ExamsUser < ActiveRecord::Base
  belongs_to :exam
  belongs_to :user
  belongs_to :ratee, foreign_key: :ratee_id, class_name: 'User'
  has_many :responses

  scope :complete, -> { where('complete=?', true) }
  scope :incomplete, -> { where('complete=?', false) }
end
