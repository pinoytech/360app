class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :description
      t.string :type
      t.integer :category_id

      t.timestamps
    end
  end
end
