class Message < ActiveRecord::Base
  belongs_to :sender, class_name: 'User', foreign_key: :from_id
  belongs_to :receiver, class_name: 'User', foreign_key: :user_id

  scope :public,  -> { where('messages.share=?', true) }
  scope :personal, -> { where('messages.share=?', false) }
  belongs_to :badge

  default_scope { order('created_at DESC') }
end
