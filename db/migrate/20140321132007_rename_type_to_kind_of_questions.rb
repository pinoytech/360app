class RenameTypeToKindOfQuestions < ActiveRecord::Migration
  def change
    rename_column :questions, :type, :kind
  end
end
