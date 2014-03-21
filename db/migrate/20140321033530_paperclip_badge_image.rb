class PaperclipBadgeImage < ActiveRecord::Migration
  def self.up
    add_attachment :badges, :image
  end

  def self.down
    remove_attachment :badges, :image
  end
end