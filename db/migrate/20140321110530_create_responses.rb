class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |t|
      t.integer :exams_user_id
      t.string :answer

      t.timestamps
    end
  end
end
