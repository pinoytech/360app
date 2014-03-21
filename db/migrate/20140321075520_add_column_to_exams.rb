class AddColumnToExams < ActiveRecord::Migration
  def change
    add_column :exams, :season_id, :integer
  end
end
