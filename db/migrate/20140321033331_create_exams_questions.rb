class CreateExamsQuestions < ActiveRecord::Migration
  def change
    create_table :exams_questions do |t|
      t.integer :question_id
      t.integer :exam_id

      t.timestamps
    end
  end
end
