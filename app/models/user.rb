class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable
  has_attached_file :avatar, :styles => {
      :small => "200x200>",
      :thumb => "100x100>"
    },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

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

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.short_description = auth.info.bio
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end
end
