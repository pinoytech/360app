class CreateSeasons < ActiveRecord::Migration
  def change
    create_table :seasons do |t|
      t.string :name
      t.string :status, default: 'closed'

      t.timestamps
    end
  end
end
