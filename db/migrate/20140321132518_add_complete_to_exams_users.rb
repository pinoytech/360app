class AddCompleteToExamsUsers < ActiveRecord::Migration
  def change
    add_column :exams_users, :complete, :boolean, default: false
  end
end
