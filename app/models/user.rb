class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :badges_users
  has_many :badges, through: :badges_users
  has_many :exams_users
  has_many :exams, through: :exams_users
  has_many :ratees, through: :exams_users, foreign_key: :ratee_id, source: :ratee, class_name: 'User'

  accepts_nested_attributes_for :ratees
  accepts_nested_attributes_for :exams

  def full_name
    [first_name, last_name].select{|x| x.present?}.join(' ')
  end

  def self.search(term)
    str = "%#{term.downcase}%"
    where('LOWER(first_name) LIKE ? OR LOWER(last_name) LIKE ? OR LOWER(email) LIKE ? AND LOWER(first_name) IS NOT NULL', str, str, str)
  end

  def message_badges_size
    self.messages.count(:badge_id)
  end

  def message_badges
    self.messages.joins(:badge)
  end
end
