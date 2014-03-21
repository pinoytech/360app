class Badge < ActiveRecord::Base
  has_attached_file :image, :styles => {
      :small => "200x200>",
      :thumb => "100x100>"
    },
    :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :badges_users
  has_many :users, through: :badges_users
end
