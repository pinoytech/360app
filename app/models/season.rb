class Season < ActiveRecord::Base
  OPEN = 'open'
  CLOSED = 'closed'
  scope :open,  -> { where('status=?', OPEN) }
  scope :closed,  -> { where('status=?', CLOSED) }

  has_many :exams

  before_save :activate_seasons

  def active?
    self.status.eql?(OPEN)
  end

  def activate_seasons
    Season.open.update_all(status: CLOSED) if self.active?
  end

  def self.active_exams
    open.first.exams
  end
end
