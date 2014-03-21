class ChangeCompleteToCompleted < ActiveRecord::Migration
  def change
    rename_column :exams_users, :complete, :completed
  end
end
