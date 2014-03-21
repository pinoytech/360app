class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :messages
  has_many :badges_users
  has_many :badges, through: :badges_users

  def full_name
    [first_name, last_name].select{|x| x.present?}.join(' ')
  end

  def self.search(term)
    str = "%#{term}%"
    where('first_name LIKE ? OR last_name LIKE ? OR email LIKE ?', str, str, str)
  end
end
