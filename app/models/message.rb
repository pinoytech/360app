class Message < ActiveRecord::Base
  belongs_to :user

  scope :public,  -> { where('messages.share=?', true) }
  scope :personal, -> { where('messages.share=?', false) }

  def from
    User.find(self.from_id)
  end
end
