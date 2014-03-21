class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.string :title
      t.text :body
      t.integer :badge_id
      t.boolean :share, default: false
      t.integer :from_id

      t.timestamps
    end
  end
end
