class Season < ActiveRecord::Base
  OPEN = 'open'
  CLOSED = 'closed'
  scope :open,  -> { where('status=?', OPEN) }
  scope :closed,  -> { where('status=?', CLOSED) }
end
