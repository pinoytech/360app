class CreateExamsUsers < ActiveRecord::Migration
  def change
    create_table :exams_users do |t|
      t.integer :exam_id
      t.integer :user_id
      t.integer :ratee_id

      t.timestamps
    end
  end
end
